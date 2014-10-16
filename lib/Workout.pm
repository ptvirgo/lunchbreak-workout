package Workout;

use strict;
use warnings FATAL => 'all' ;

use Cwd 'abs_path';
use DBD::SQLite;
use File::Spec;
require Workout::Exercise;

# Grab the database

my $data_file = 'fitocrat.db';
my ($vol, $dir, $self) = File::Spec->splitpath(abs_path(__FILE__));
my $database = abs_path($dir . '/Workout/' . $data_file);
my $DBH = DBI->connect("dbi:SQLite:dbname=$database", "", "")
  or die $DBI::errstr;

=head1 Functions


=cut

=head1 new ( gear => \@gear, calisthenics => boolean );

Parameters:

  gear => an array reference containing names of exercise equipment as can be
  found in the database.

  calisthenics => interpreted as a boolean.  If true, the workout will
specifically take the format of the calisthenics routines from the Corps
Strength book.

Returns:

  Blessed hash reference including the gear and calisthenics values, as well as
a mission key to a string describing the workout.

=cut

sub new
{
  my $class = shift;
  my %args = @_;

  my $self = {};
  bless $self, $class;

  my $calisthenics;

  if ( defined( $args{'calisthenics'} ) )
  {
    $calisthenics = $args{'calisthenics'} ? 1 : 0;
  } else {
    $calisthenics = 0;
  }
  $self->{'calisthenics'} = $calisthenics;

  my @gear;

  if ( defined( $args{'gear'} ) )
  {
    @gear = @{ $args{'gear'} };
  } else {
    @gear = ( 'none' );
  }

  $self->{'gear'} = \@gear;

  my $mission = $calisthenics
    ? $self->_calisthenics_mission()
    : $self->_standard_mission() // $self->_calisthenics_mission();

  $self->{'mission'} = $mission;

  return $self;
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

  my @collection = sort( keys( $sth->fetchall_hashref('name')));
  my @verified;

  for my $gear (@collection)
  {
    $self->{'gear'} = [ 'none', $gear ];
    if ( $self->_standard_mission )
    {
      push (@verified, "$gear (can complete standard mission)" );
    } else {
      push (@verified, $gear);
    }
  }

  return @verified;
}

=head2 _neck_or_grip()


Randomly returns the work 'neck' or the word 'grip as a string.

=cut

sub _neck_or_grip
{
  my $self = shift;
  return int(rand(2)) == 0
    ? 'neck'
    : 'grip';
}

=head2 _standard_mission()

Returns
  Text describing a sample mission set using the gear limitations of the
workout, or without limitations if the workout does not call for such
limitations.  Uses the standard mission formula as described by the
Corps Strength book.

=cut

sub _standard_mission
{
  my $self = shift;
  my @foci = ( qw( pull-up push-up wheel-house abs assist abs ),
    $self->_neck_or_grip(),
    qw( abs ) );

  my @set = $self->_random_set(@foci);
  if ( scalar(@set) == scalar(@foci) )
  {
    $self->{'calisthenics'} = 0;
    return sprintf
      "1. %s (10 x 3), alternate with %s (25 x 3)\n" .
      "2. %s (10-15 x 3), alternate with %s (50 x 3)\n" .
      "3. %s (10-15 x 3), alternate with %s (50 x 3)\n" .
      "4. %s (Max x 2), alternate with %s (50)\n",
      map { $_->{'name'} } @set;
  } else {
    return;
  }
}

=head2 _calisthenics_mission()

Returns
  Text describing a sample mission set using the gear limitations of the
workout, or without limitations if the workout does not call for such
limitations.  Uses the calisthenics mission formula as described by the
Corps Strength book.

=cut

sub _calisthenics_mission
{
  my $self = shift;

  my @foci = qw( pull-up push-up abs wheel-house wheel-house abs );
  my @set = $self->_random_set(@foci);

  if ( scalar(@set) == scalar(@foci) )
  {
    $self->{'calisthenics'} = 1;
    return sprintf
      "1. %s (10 x 3),\n   %s (25 x 3),\n   %s (50 x 3)\n" .
      "2. %s (25 x 3),\n   %s (10 x 3),\n   %s (50 x 3)\n",
      map { $_->{'name'} } @set;
  } else {
    return;
  }
}

sub _random_set
{
  my $self = shift;
  my @foci = @_;

  my @set;

  for my $focus (@foci)
  {
    my $exercise =
      Workout::Exercise->random(
        focus => $focus,
        gear  => $self->{'gear'}
      );

    if (defined($exercise))
    {
      push (@set, $exercise);
    } else {
      return;
    }
  }
  return @set;
}

1;
