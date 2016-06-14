package Workout::Exercise;

use strict;
use warnings FATAL => 'all' ;

# Database
use Cwd 'abs_path';
use DBD::SQLite;
use File::Spec;

=head1 Workout::Exercise

=cut

# Database
  my $data_file = 'fitocrat.db';
  my ($vol, $dir, $self) = File::Spec->splitpath(abs_path(__FILE__));
  my $database = abs_path($dir . '/' . $data_file);
  my $DBH = DBI->connect("dbi:SQLite:dbname=$database", "", "")
    or die $DBI::errstr;

=head2 new( id => numeric id );

Parameters

  id => numeric_id should be the SQL ID of the exercise you want pulled from
the database.

Returns

  The Exercise object, including an id, name, focus (the general 'type'), and
optionally a url to a description or training video of the exercise.

=cut

sub new
{
  my $class = shift;
  my %args = @_;

  my $id = delete( $args{'id'} );

  if ( !defined($id) )
  {
    die "Can't create an exercise without an id.\n";
  }

  my $search = << "SQL"
SELECT exercise.id AS id,
    exercise.name AS name,
    focus.name AS focus,
    exercise.url AS url
FROM exercise
JOIN focus on exercise.focus = focus.id
WHERE exercise.id = ?
LIMIT 1
SQL
  ;

  my $sth = $DBH->prepare($search);
  $sth->execute( $id );
  my $self = $sth->fetchrow_hashref();

  bless $self, $class;
  return $self;
}

=head2 random( focus => exercise_type, gear => \@equipment_list, exclude => \@exercise_ids);

Parameters

  focus => the name of an exercise focus area as listed in the database or the
Corps-Strength book, such as push-up, wheel-house, assist, etc.

  gear => an array reference containing names of exercise equipment as can be
found in the database.

  exclude => an array reference containing numeric ids of exercises to
be excluded from consideration.

Returns

  An exercise object, randomly chosen, limited to the focus and equipment as
specified.

=cut

sub random
{
  my $class = shift;
  my %args = @_;

  my $focus = $args{'focus'};
  my @gear;
  if ( defined( $args{'gear'} ) )
  {
    @gear = @{ $args{'gear'} };
  }

  my @exclude;
  if ( defined ( $args{'exclude'} ) )
  {
    @exclude = @{ $args{'exclude'} };
  }

  my $where = '';

  if ($focus)
  {
    $where .= "WHERE focus.name = '$focus'\n";
  }

  if ( scalar(@gear) )
  {
    my $clause = ( $where eq '' )
    ? 'WHERE'
    : 'AND';

    my $identifier = "('" . join ("', '", @gear) . "')";
    $where .= "$clause gear.name IN $identifier\n";
  }

  if ( scalar(@exclude) )
  {
    my $clause = ( $where eq '' )
    ? 'WHERE'
    : 'AND';
    my $identifier = "('" . join ("', '", @exclude) . "')";
    $where .= "$clause exercise.id NOT IN $identifier\n";
  }

  my $search = << "SQL"
SELECT exercise.id as id
FROM exercise
JOIN focus ON exercise.focus = focus.id
JOIN exercise_gear ON exercise.id = exercise_gear.exercise_id
JOIN gear ON exercise_gear.gear_id = gear.id
$where
ORDER BY RANDOM()
LIMIT 1
SQL
  ;

  my $sth = $DBH->prepare($search);
  $sth->execute();
  my $result = $sth->fetchrow_hashref();

  if ( defined( $result->{'id'} ) )
  {
    my $self = new( $class, id => $result->{'id'} );
    return $self;
  } else {
    return;
  }
}

=head2 list_gear()

Return all the names listed in the gear table, so you can discover all possible
gear options.

=cut

sub list_gear
{
  my $self = shift;

  my $sth = $DBH->prepare('SELECT name FROM gear');
  $sth->execute();

  my @list = sort( keys( $sth->fetchall_hashref('name')));
  return @list;
}

=head2 list_focus()

Return all the names listed in the focus table, so you can discover the possible
focus options.

=cut

sub list_focus
{
  my $self = shift;
  my $sth = $DBH->prepare('SELECT name FROM focus');
  $sth->execute();

  my @list = sort( keys( $sth->fetchall_hashref('name')));
  return @list;
}

=head2 list_exercises()

Return names and ids from the exercise table, so you can discover possible
exercise options.

=cut

sub list_exercises
{
  my $self = shift;
  my $sth = $DBH->prepare('SELECT id, name FROM exercise');
  $sth->execute();

  my %list;
  while ( my $record = $sth->fetchrow_hashref() )
  {
    $list{ $record->{'id'} } = $record->{'name'};
  }

  return %list;
}

1;
