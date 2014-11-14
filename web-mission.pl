#!/usr/bin/perl

use local::lib;
use Workout;
use Mojolicious::Lite;

my @NAVIGATION = qw(about calisthenics dumbbell kettlebell);

under sub {
  my $c = shift();
  $c->stash( navigation => \@NAVIGATION );
};

get '/' => sub {
  my $c = shift();
  my $content =
<<HTML
<p>Click one of the navigation links to create a random workout mission
with the associated gear, or see the about page for a few more
details.</p>
HTML
  ;

  $c->stash(
    title     => 'Mission Generator',
    content   => $content,
  );
  $c->render('index');
};

get '/about' => sub {
  my $c = shift();
  my $content =
<<HTML
<p>This is a simple tool to generate workout missions in accordance with
the book <a href="http://corpsstrength.com">"Corps Strength"</a> by
MGySgt Paul J. Roarke Jr.  It's deliberately a little sparse on the
details and context because I am not affiliated with the author. I do
recommend his book as an effective and accessible exercise plan.</p>
<p>I wrote this tool in order to make my lunch breaks a little
healthier, as well as to demonstrate what I've been learning about Perl,
SQL, git, and now MojoLicious.</p>


<p>Source code hosted on <a
href="https://github.com/ptvirgo/corps-strength">github</a>.
Improvements and solid suggestions are welcome.</p>

HTML
  ;

  $c->stash(
    title     => 'About',
    content   => $content,
  );
  $c->render('index');
};


get '/style/workout' => [format => ['css']] => sub {
  my $c = shift();

  $c->render('style');
};

get '/calisthenics' => sub {
  my $c = shift();

  my @gear = ('none');
  
  my $workout = Workout->new( gear => \@gear, calisthenics => 1 );

  $c->stash(
    title   => "Calisthenics Mission",
    content => $workout->mission( format => 'html' ),
    format  => 0,
  );
  $c->render('index');
};

get '/:equipped' => sub {
  my $c = shift();

  my $equipped = lc( $c->stash('equipped') );
  if ( ! grep (/$equipped/, @NAVIGATION ) )
  {
    return $c->reply->not_found(); 
  }

  my @gear = $equipped;

  if ( !($equipped eq 'none') )
  { 
    push(@gear, 'none');
  }
  
  my $workout = Workout->new( gear => \@gear );
  $c->stash(
    title   => ucfirst( "$equipped Mission" ),
    content => $workout->mission( format => 'html' ),
    format  => 0,
  );
  $c->render('index');
};


app->start();
