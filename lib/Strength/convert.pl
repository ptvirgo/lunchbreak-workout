#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my ( $filename ) = @ARGV;

if ( !defined( $filename ))
{
  die "Please specify a list of exercises to convert.\n";
}

open ( my $data, "<", $filename ) or die "Unable to open $filename\n";

while ( my $exercise = <$data> )
{
  chomp $exercise;
  my $exercise_entry = code_transaction( $exercise );

  if ( defined( $exercise_entry ))
  {
    print "$exercise_entry\n";
  }

}

# Subroutines

sub code_transaction
{
  my ( $entry ) = @_;
  if ( $entry =~ m/^#/ )
  {
    return undef;
  }

  # Data should have form name:class:gear,gear,..:url
  my
  (
    $ex_name,
    $ex_class,
    $ex_gear,
    $ex_url
  ) = split /\|/, $entry;

  my @gear = split /,/, $ex_gear;

  my $transaction = "BEGIN TRANSACTION;\n";
  $transaction .= code_exercise( $ex_name, $ex_class, $ex_url );
  
  for my $gear (@gear)
  {
    $transaction .= code_exercise_gear( $ex_name, $gear );
  }

  $transaction .= "END TRANSACTION;\n";
  return $transaction;
}

sub code_exercise
{
  my ( $name, $class, $url ) = @_;
  my $sql;

  if
  (
    !defined( $url )
    ||
    $url eq ''
  )
  {
    $sql = << "SQL"
  INSERT INTO exercises (name, class)
  VALUES (
    '$name',
    (SELECT id FROM class WHERE name = '$class')
  );
SQL
    ;
  } else
  {
    $sql = << "SQL"
  INSERT INTO exercises (name, class, url)
  VALUES (
    '$name',
    (SELECT id FROM class WHERE name = '$class'),
    '$url'
  );
SQL
    ;
  }

  return $sql;
}

sub code_exercise_gear
{
  my ( $name, $gear ) = @_;
  return << "SQL"

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = '$name'),
    (SELECT id FROM gear WHERE name = '$gear')
  );
SQL
  ;
}
