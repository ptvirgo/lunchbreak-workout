package Workout;

use strict;
use warnings FATAL => 'all' ;

require Workout::Exercise;

=head1 FUNCTIONS


=cut

=head1 new ( gear => \@gear, focus => \@focus );

Parameters:

  gear => an array reference containing names of exercise equipment as can be
  found in the database.

  focus => an array reference containing names of exercise focuses as can be
  found in the database.

Returns:

  Workout object, with attributes:

  exercises => an array reference of exercise objects
  gear => array reference of the original gear argument

=cut

sub new
{
  my $class = shift;
  my %args = @_;

  my $self = {};
  bless $self, $class;

  return if ( !$args{'focus'} );
  my @foci = @{ $args{'focus'} };

  my @gear = defined( $args{'gear'} )
    ?  @{ $args{'gear'} }
    : undef;

  my @exercises;
  my @exclude;

  foreach my $focus (@foci)
  {
    my $exercise = Workout::Exercise->random(
      gear    => \@gear,
      focus   => $focus,
    );

    if ( $exercise )
    {
      push( @exercises, $exercise );
      push( @exclude, $exercise->{'id'} );
    }
  }

  return if !scalar( @exercises );

  $self->{'exercises'} = \@exercises;
  $self->{'gear'} = \@gear;

  return $self;
}

1;
