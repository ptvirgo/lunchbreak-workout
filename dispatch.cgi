#!/usr/bin/perl

use local::lib;
use Workout;
use Workout::Exercise;
use Mojolicious::Lite;
use JSON;

use Data::Dumper;

my @DETAILS = qw( id url focus name );
my %EXERCISES = Workout::Exercise->list_exercises();
my @FOCUS = Workout::Exercise->list_focus();
my @GEAR = Workout::Exercise->list_gear();
my $JSON = JSON->new();

get '/' => sub {
  my $self = shift;

  $self->stash(
    title   => 'Workout Generator',
    content => '<p>Use the icons to choose your preferred workout length and equipment.</p>');

  return $self->render( 'generator' );
};

get '/about' => sub {
  my $self = shift;
  my $title = 'About';
  my $content = <<"ABOUT"
<p>You're probably trying to balance a crazy schedule while wanting to improve your
fitness.  I hope this tool helps you on your path.</p>

<p>In addition to helping me stay in shape, I wrote this as an exercise to
demonstrate what I've been learning about software development. It's running
with Perl, SQLite and Javascript.  I also wrote the HTML templates and CSS.
I make no claims to graphic design skills.</p>

<p>There are probably bugs, especially since this is my first attempt at releasing
software into the wild.  If you'd care to provide feedback or help me make
improvements, you can do so <a href="https://github.com/ptvirgo/lunchbreak-workout">on
github</a>.</p>
ABOUT
;

  $self->stash( title => $title, content => $content );

  return $self->render( 'index' );

};

get '/api' => sub {
  my $self = shift;
  my $title = 'API';

  my $gear = $JSON->encode( \@GEAR );
  my $focus = $JSON->encode( \@FOCUS );

  my $content = <<"API"

<h2><a href="/api/gear">/api/gear</a></h2>
<p>List the gear names available to the api.</p>
<p><strong>Parameters:</strong> none</p>
<p><strong>Returns:</strong> JSON string listing exercise equipment available as arguments to the
/exercise <em>gear</em> parameter.</p>
<p><strong>Example:</strong></p>
<code>
$gear
</code>

<h2><a href="/api/focus">/api/focus</a></h2>
<p>List the body-training areas available to the api.</p>
<p><strong>Parameters:</strong> none</p>
<p><strong>Returns:</strong> JSON string listing body-training areas available
as arguments to the /api/exercise <em>focus</em> parameter.</p>
<p><strong>Example:</strong></p>
<code>
$focus
</code>

<h2><a href="/api/exercise">/api/exercise</a></h2>
<p>Select a random exercise from the database.  Limits possible exercises to
those matching the <em>gear</em> and <em>focus</em> parameters if they are
provided.</p>
<p>Not all <em>gear</em> and <em>focus</em> combinations are available in the
database.  For example, if you ask for an <em>abs</em> exercise that uses a
<em>neck-harness</em>, you'll get no results.  Include <em>none</em> with your
<em>gear</em> list if you want to make sure that at minimum you get an exercise
that can be done without any equipment. Per our example, requesting an
<em>abs</em> exercise with <em>neck-harness,none</em> as <em>gear</em> will get
some kind of sit-up.</p>

<p><strong>Parameters:</strong></p>
<ul>
  <li>exclude: comma separated list of exercise id numbers to be excluded from
  <li>focus: a single training focus as can be found in the database.</li>
  <li>gear: comma separated list of exercise equipment as can be found in the database.</li>
possible selection.  Useful if you want to create a workout sequence without
repeats.</li>
</ul>

<p><strong>Returns:</strong> A random exercise from the database, encoded as a
JSON string.  Attributes are:</p>
<ul>
  <li>id: database id of the exercise, which could be used to exclude it from future selections</li>
  <li>focus: training focus of the exercise</li>
  <li>name: name of the exercise</li>
  <li>url: optional url linking to a youtube demo of the exercise</li>
</ul>

<p><strong>Example:</strong> <a
href="/api/exercise?gear=dumbbell,none&focus=assist&exclude=13">/api/exercise?gear=dumbbell,none&focus=assist&exclude=13</a></p>
<code id="exercise-sample"></code>
<script type="text/javascript">

\$(function(){

  \$.get( '/api/exercise', { 'gear': 'dumbbell,none', 'exclude': 13, 'focus':
'assist'},
    function ( data, status ) {
      \$('#exercise-sample').append(data);
  });
});

</script>

<h2><a href="/api/workout">/api/workout</a></h2>

<p>Build an array of exercises based on an array of focus areas.  Strictly
speaking, just included because using multiple AJAJ calls to create the demo
proved entirely too slow.</p>

<p><strong>Parameters:</strong></p>

<ul>
  <li>focus: required, comma separated list of training foci as can be found in the database.</li>
  <li>gear: comma separated list of exercise equipment as can be found in the database.</li>
</ul>

<p><strong>Returns:</strong> A JSON encoded array of exercise objects.</p>
<p><example><a
href="/api/workout?gear=kettlebell,none&focus=assist,wheel-house">/api/workout?gear=kettlebell,none&focus=assist,wheel-house</a></p>
<code id="workout-sample"></code>
<script type="text/javascript">

\$(function() {
  \$.get( '/api/workout', { 'gear': 'kettlebell,none',
'focus': 'assist,wheel-house'},
    function ( data, status ) {
      \$('#workout-sample').append(data);
  });
});
</script>

API
;

  $self->stash( title => $title, content => $content );

  return $self->render( 'index' );
};

get '/recommended_reading' => sub {
  my $self = shift;
  my $title = 'Recommended Reading';
  my $content = <<"BOOK"
<p>If you're working the kind of desk-jockey job that normally destroys a person's
health, and a regular practice of going to the gym would steal too much precious
time from family and friends, I recommend reading <a href="http://corpsstrength.com">"Corps
Strength"</a> by MGySgt Paul J. Roarke Jr.</p>

<p>Roarke drew on years of experience training Marines to develop an extremely
effective, simple fitness program.  It can be followed with only a few hours a
week in-any environment you are likely to encounter.  His no-nonsense focus on
working-fitness emphasizes that anyone can have health, strength, and endurance
to spare without having to turn exercise into a part-time career.</p>

<p>I've been working in a career that normally destroys people's physical health.
The stereotypical IT guy needs to lose over a hundred pounds and struggles with
two flights of stairs.  We've all seen this, in almost any industry.
Professionals aren't lazy.  We work crazy hours and need what little time and
energy is left to touch base with the people we love.</p>

<p>Roarke's book gave me a solution that I could implement on 2 - 3 lunch breaks
per week.  Thanks to his routine, I'm not worrying that I might die of a heart
attack in my 40s.  I'm participating in the occasional Spartan Race. I'm enjoying
the fact that my wife tells my I'm one of the strongest and most attractive
people she's met. I'm reminding friends and family that fitness is available to
anyone.</p>

<p>I hope that by sharing this little tool I've can encouraged you to build some
health and strength into your life.  You don't have to get sucked into a
constant state of stress and exhaustion.  Grab a copy of Roarke's book, swing
back here when you've got a spare lunch break, and stay strong.</p>
BOOK
;

  $self->stash( title => $title, content => $content );

  return $self->render( 'index' );

};


get '/api/exercise' => sub {
  my $self = shift;

  my $focus = lc( $self->param( 'focus' ));

  my $gear = ( $self->param( 'gear' ))
    ? [ split( /,/, lc( $self->param( 'gear' ))) ]
    : undef;

  my $exclude = ( $self->param( 'exclude' ))
    ? [ split( /,/, $self->param( 'exclude' )) ]
    : undef;

  if ( $focus )
  {
    if ( !( validate_whitelist( whitelist => \@FOCUS, data => [ $focus ] )))
    {
      $self->stash( error => 'invalid focus' );
      return $self->render( 'error' );
    }
  }

  if ( $gear )
  {
    if( !( validate_whitelist( whitelist => \@GEAR, data => $gear )))
    {
      $self->stash( error => 'invalid gear' );
      return $self->render( 'error' );
    }
  }

  if ( $exclude )
  {
    if( !( validate_whitelist( whitelist => [ keys( %EXERCISES ) ],
      data => $exclude )))
    {
      $self->stash( error => 'invalid exercise id' );
      return $self->render( 'error' );
    }
  }

  my $exercise = Workout::Exercise->random(
    exclude => $exclude,
    gear    => $gear,
    focus   => $focus
  );

  if ( !$exercise )
  {
    $self->stash( error => 'no match' );
    return $self->render( 'error' );
  }

  my %exercise_info;

  foreach my $detail ( @DETAILS )
  {
    $exercise_info{ $detail } = $exercise->{ $detail };
  }

  # Near as I can tell, Mojolicious's native JSON encoder incorrectly escapes
  # '/', # making URLs unusable by $.parseJSON

  my $content = $JSON->encode( \%exercise_info );
  return $self->render( text => $content);

};

get '/api/workout' => sub {
  my $self = shift;

  my $focus = ( $self->param( 'focus' ))
    ? [ split( /,/, lc( $self->param( 'focus' ))) ]
    : undef;
    
  my $gear = ( $self->param( 'gear' ))
    ? [ split( /,/, lc( $self->param( 'gear' ))) ]
    : undef;

  if ( $focus )
  {
    if ( !( validate_whitelist( whitelist => \@FOCUS, data => $focus )))
    {
      $self->stash( error => 'invalid focus' );
      return $self->render( 'error' );
    }
  }

  if ( $gear )
  {
    if( !( validate_whitelist( whitelist => \@GEAR, data => $gear )))
    {
      $self->stash( error => 'invalid gear' );
      return $self->render( 'error' );
    }
  }

  my $workout = Workout->new(
    gear    => $gear,
    focus   => $focus
  );

  if ( !$workout )
  {
    $self->stash( error => 'unable to create workout' );
    return $self->render( 'error' );
  }

  my @workout_info;
  foreach my $exercise ( @{ $workout->{'exercises'} })
  {
    my %exercise_info;

    foreach my $detail( @DETAILS )
    {
      $exercise_info{ $detail } = $exercise->{ $detail };
    }

    push( @workout_info, \%exercise_info );
  }

  my $content = $JSON->encode( \@workout_info );
  return $self->render( text => $content);

};

get '/api/gear' => sub {
  my $self = shift;

  my $content = $JSON->encode( \@GEAR );
  return $self->render( text => $content );
};

get '/api/focus' => sub {
  my $self = shift;

  my $content = $JSON->encode( \@FOCUS );
  return $self->render( text => $content );
};

=head1 SUBROUTINES

=cut

=head2 validate_whitelist( whitelist => @acceptable, data => @recieved );

Parameters:  A whitelist of acceptable values, and values to confirm were
present.

Returns: True if every item in @recieved appears in the whitelist.  False
otherwise.

=cut

sub validate_whitelist
{

  my %args = @_;

  return if ( !$args{'whitelist'} );
  return if ( !$args{'data'} );

  my @whitelist = @{ delete( $args{'whitelist'} ) };
  my @data = @{ delete( $args{'data'} ) };

  for my $data_point ( @data )
  {

    if ( !( grep( /^$data_point$/, @whitelist )))
    {
      return;
    }

  }

  return 1;

}

app->start();

__DATA__

@@ not_found.html.ep

{
  "error": "not found"
}

@@ error.html.ep
{
  "error": "<%= $error %>"
}
