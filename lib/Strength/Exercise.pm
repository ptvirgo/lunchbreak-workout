#!/usr/bin/perl
use warnings FATAL => 'all';
use strict;

package Strength::Exercise;
use Cwd 'abs_path';
use DBD::SQLite;
use File::Spec;

=head1 Strength::Exerecise


This is a simple procedural library, intended to help the author learn a
bit about sql and create a simple exercise routine generator.

=cut

# purist.db only contains exercises from the original book, with the
# same names and links to instruction that is as close as possible to
# the source.

my $data_file = 'fitocrat.db';
my ($vol, $dir, $self) = File::Spec->splitpath(abs_path(__FILE__));
my $database = abs_path($dir . '/' . $data_file);
my $dbh = DBI->connect("dbi:SQLite:dbname=$database", "", "")
  or die $DBI::errstr;
=head1 Functions

=head2 random_exercise($class, @gear)

Take a class name, which should match one of the classes from the
class table.

Take an optional list of acceptable gear, which should be among the
options from the gear table.

Return a hash containing values for one random exercise of the
designated class.

=cut

sub random_exercise
{
  my ($class, @gear) = @_;

  my $search;

  if (scalar(@gear) == 0)
  {
    $search = << "SQL"
SELECT exercises.id AS id,
       exercises.name AS name,
       class.name AS class,
       exercises.url AS url 
FROM exercises
JOIN class ON exercises.class = class.id
WHERE class.name = '$class'
ORDER BY RANDOM()
LIMIT 1
SQL
      ;
  } else
  {
    my $gear = "( '" . join("', '", @gear) . "' )";
    $search = << "SQL"
SELECT exercises.id AS id,
       exercises.name AS name,
       class.name AS class,
       exercises.url AS url 
FROM exercises
JOIN class ON exercises.class = class.id
JOIN exercise_gear ON exercises.id = exercise_gear.exercise_id
JOIN gear ON exercise_gear.gear_id = gear.id
WHERE class.name = '$class' 
AND gear.name IN $gear
ORDER BY RANDOM()
LIMIT 1
SQL
      ;
  }

  my $sth = $dbh->prepare($search);
  $sth->execute();

  return $sth->fetchrow_hashref();
}

=head2

list_gear()

Return the names listed in the gear table

=cut

sub list_gear
{
  my $sth = $dbh->prepare('SELECT name FROM gear');
  $sth->execute();
  return keys($sth->fetchall_hashref('name'));
}

1;
