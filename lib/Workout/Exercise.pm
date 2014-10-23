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
WHERE exercise.id = '$id'
LIMIT 1
SQL
  ;

  my $sth = $DBH->prepare($search);
  $sth->execute();
  my $self = $sth->fetchrow_hashref();

  bless $self, $class;
  return $self;
}

=head2 random( focus => exercise_type, gear => \@equipment_list );

Parameters

  focus => the name of an exercise focus area as listed in the database or the
Corps-Strength book, such as push-up, wheel-house, assist, etc.

  gear => an array reference containing names of exercise equipment as can be
found in the database.

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
    $where .= "$clause gear.name in $identifier\n";
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

=head2 link( format => 'markdown' or 'html' )

Parameters

  Optional 'format' argument can be used to request simple markdown
(default) or html formatting.  One might expect html to be the default
option for a link, however the parent library defaults to markdown for
other types of output and I've opted to be consistant rather than purely
"logical."

Returns
  A string consisting of the name of the exercise encapsulated in a
markdown or html type link if the url attribute has been defined.

=cut

sub link
{
  my $self = shift;
  my %args = @_;

  my $link;

  if ( !defined ($self->{'url'} ) )
  {
    $link = $self->{'name'};
  } elsif (
    !defined ( $args{'format'} )
    ||
    lc( $args{'format'} ) eq 'markdown'
  )
  {
    $link = "[$self->{'name'}]($self->{'url'})";
  } elsif ( lc( $args{'format'} ) eq 'html' ) {
    $link =
      '<a href = "'. $self->{'url'} . '">' .
      $self->{'name'} .
      '</a>';
  } else {
    die "Invalid format requested.";
  }

  return $link;
}


1;
