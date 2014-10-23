#! /usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use File::Basename;
use FindBin qw( $RealBin );
use lib "$RealBin/lib";

use Getopt::Long;
use Workout;

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
  print join("\n * ", "# Gear Options\n", Workout->new->list_gear()),
    "\n\n";
  exit 0;
}

if (scalar(@gear))
{
  if (!grep(m/none/, @gear))
  {
    push(@gear, 'none');
  }
} elsif ($cal) {
  @gear = ( 'none' );
}

my $workout = Workout->new(
  calisthenics => $cal,
  gear         => \@gear,
);

my $title = $workout->{'calisthenics'}
  ? "Calisthenics Mission"
  : "Standard Mission";

print "# $title\n\n";
print $workout->mission( format => 'markdown' );

=head1 Functions


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
  $usage .= sprintf "   %-25s Generate calisthenics format workout\n",
    "-c or --calisthenics";
  $usage .= sprintf "   %-25s List gear available to this script\n",
    "-l or --list";
  $usage .= sprintf "   %-25s Specify that you have [GEAR] available",
    "-g or --gear [GEAR]";

  return $usage;
}
