#! /usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Getopt::Long;
use FindBin qw( $RealBin );
use File::Basename;

use lib "$RealBin/lib";
use Strength::Exercise;

my ($cal, @gear, $help, $list);
GetOptions(
  'calisthenics' => \$cal,
  'gear=s'       => \@gear,
  'help'         => \$help,
  'list'         => \$list
);

if ($help)
{
  print help(), "\n";
  exit 0;
}

if ($list)
{
  print join("\n * ", "# Gear Options\n", Strength::Exercise::list_gear()),
    "\n\n";
  exit 0;
}

if (scalar(@gear))
{
  if (!grep(m/'none'/, @gear))
  {
    push(@gear, 'none');
  }
}

my $mission =
  $cal
  ? calisthenics_mission(@gear)
  : standard_mission(@gear);

if (defined($mission))
{
  print "# Mission Cycles\n\n$mission\n";
} else
{
  die "Unable to create desired mission with the equipment listed.\n";
}


=head1 Functions



=head2 neck_or_grip()


Randomly returns the word 'neck' or the word 'grip'

=cut

sub neck_or_grip
{
  return int(rand(2)) == 0
    ? 'neck'
    : 'grip';
}

=head2 standard_mission(@gear)


Take an optional list of acceptable gear.  Return
text describing a sample exercise mission set using only specified gear,
or without gear limitations if none are specified.
  
=cut

sub standard_mission
{
  my (@gear) = @_;

  my @sets;
  my @classes =
    (qw( pull-up push-up wheel-house abs assist abs ), neck_or_grip(), 'abs');

  for my $class (@classes)
  {
    my $exercise = Strength::Exercise::random_exercise($class, @gear);

    if (defined($exercise))
    {
      delete($exercise->{'url'});
      push(@sets, format_exercise($exercise));
    }
  }

  # If we got the full set.
  if (scalar(@sets) == scalar(@classes))
  {
    return
        sprintf "1. %s (10 x 3), alternate with %s (25 x 3)\n"
      . "2. %s (10-15 x 3), alternate with %s (50 x 3)\n"
      . "3. %s (10-15 x 3), alternate with %s (50 x 3)\n"
      . "4. %s (Max x 2), alternate with %s (50)\n",
      @sets;
  } else

    # Weren't able to create a full set.
  {
    return undef;
  }
}

=head2 calisthenics_mission(@gear)


Take an optional list of acceptable gear.  Return
text describing a sample exercise mission set using only specified gear,
or without gear limitations if none are specified.
  
=cut
sub calisthenics_mission
{
  my @gear = @_;
  my @sets;
  my @classes = qw ( pull-up push-up abs wheel-house wheel-house abs );

  for my $class (@classes)
  {
    my $exercise = Strength::Exercise::random_exercise($class, @gear);

    if (defined($exercise))
    {
      delete($exercise->{'url'});
      push(@sets, format_exercise($exercise));
    }
  }

  if (scalar(@sets) == scalar(@classes))
  {
    return
      sprintf "1. %s (10 x 3),\n   %s (25 x 3),\n   %s (50 x 3)\n\n"
      . "2. %s (25 x 3),\n   %s (10 x 3),\n   %s (50 x 3)\n",
      @sets;
  } else
  {
    return undef;
  }
}

=head2 format_exercise($exercise)


Take an execise as described by a hash reference. Would typically
contain:
  {
    id    => database key, 
    name  => name,
    class => class,
    url   => optional url to online instruction
  }

Return a string, either just the name, or a markdown formatted url
with the name, such as [name](url), depending on whether url is defined.

=cut

sub format_exercise
{
  my ($exercise) = @_;

  if (defined($exercise->{'url'}))
  {
    return '(' . $exercise->{'name'} . ')[' . $exercise->{'url'} . ']';
  } else
  {
    return $exercise->{'name'};
  }
}

=head2 help()


Print a usage message.

=cut

sub help
{
  my ($name) = basename(__FILE__);
  my $usage = "Usage: $name [OPTIONS]\n\n";
  $usage .= "   Standard workout, any gear: `$name`\n\n";
  $usage .= "   Standard workout using kettbell and gripper:\n";
  $usage .= "   `$name -g kettlebell -g gripper`\n\n";
  $usage .= "   Calisthenics only: `$name -c`\n\n";

  $usage .= <<'DESC'
Generates an exercise routine based on the Stand Alone Training model
described in the book 'Corps Strength' by Paul J. Roarke Jr.  SAT
Routines are only a part of the full program, it is recommended that you
review the book.

DESC
    ;
  $usage .= "Options:\n";
  $usage .= sprintf "   %-25s Print this help message\n", "--help";
  $usage .= sprintf "   %-25s Generate calisthenics-only workout\n",
    "-c or --calisthenics";
  $usage .= sprintf "   %-25s List gear available to this script\n",
    "-l or --list";
  $usage .= sprintf "   %-20s Specify that you have [GEAR] available",
    "-g or --gear [GEAR]";

  return $usage;
}
