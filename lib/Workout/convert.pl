#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

my ( $filename ) = @ARGV;

if ( !defined( $filename ))
{
  die "Please specify a list of exercise to convert.\n";
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

  # Data should have form name:focus:gear,gear,..:url
  my
  (
    $ex_name,
    $ex_focus,
    $ex_gear,
    $ex_url
  ) = split /\|/, $entry;

  my @gear = split /,/, $ex_gear;

  my $transaction = "BEGIN TRANSACTION;\n";
  $transaction .= code_exercise( $ex_name, $ex_focus, $ex_url );
  
  for my $gear (@gear)
  {
    $transaction .= code_exercise_gear( $ex_name, $gear );
  }

  $transaction .= "END TRANSACTION;\n";
  return $transaction;
}

sub code_exercise
{
  my ( $name, $focus, $url ) = @_;
  my $sql;

  if
  (
    !defined( $url )
    ||
    $url eq ''
  )
  {
    $sql = << "SQL"
  INSERT INTO exercise (name, focus)
  VALUES (
    '$name',
    (SELECT id FROM focus WHERE name = '$focus')
  );
SQL
    ;
  } else
  {
    $sql = << "SQL"
  INSERT INTO exercise (name, focus, url)
  VALUES (
    '$name',
    (SELECT id FROM focus WHERE name = '$focus'),
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
    (SELECT id FROM exercise WHERE name = '$name'),
    (SELECT id FROM gear WHERE name = '$gear')
  );
SQL
  ;
}
