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
    title     => 'Workout Generator',
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

__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html>
<head>
  <title><%= $title %></title>
  <link rel="stylesheet" type="text/css" href="/style/workout.css">
</head>
<body>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
      <% for my $link (@{ $navigation }) { %>
      <li><a href="/<%= lc($link) %>"><%= ucfirst($link) %></a></li>
      <% } %>
    </ul>
  </nav>
  <main>
    <h1><%= $title %></h1>
    <%== $content %>
  </main>
  <footer>2014 &copy; Pablo Virgo</footer>
</body>
</html>

@@ not_found.html.ep

<% my $title = "404 Not Found"; %>
<!DOCTYPE html>
<html>
<head>
  <title><%= $title %></title>
  <link rel="stylesheet" type="text/css" href="/style/workout.css">
</head>
<body>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
    </ul>
  </nav>
  <main>
    <h1><%= $title %></h1>
    <p>There is no such page. Maybe stick to the links that work.</p>
  </main>
  <footer>2014 &copy; Pablo Virgo</footer>
</body>
</html>

@@ style.css.ep
body {
  color: #222;
  font-family: 'Liberation Sans', sans-serif; 
}

a {
  color: #474;
  font-weight: bold;
  text-decoration: none;
}

a:hover {
  color: #393;
  text-decoration: underline;
}

a:visited {
  color: #376;
}

h1, h2, h3, h4, h5, h6 {
  margin: 0 0 .5em 0;
  padding: 0;
}

p {
  margin: 0 0 1em 0;
  padding: 0;
}

main {
  background-color: #eee;
  border-left: 1px solid #222;
  border-top: 1px solid #222;
  border-right: 3px solid #222;
  border-bottom: 3px solid #222;
  border-bottom-left-radius: .25em;
  border-top-right-radius: .5em;
  border-bottom-right-radius: .25em;
  margin: 0;
  padding: .5em 1ex;
}

nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

nav ul li {
  display: inline;
  border-left: 1px solid #222;
  border-top: 1px solid #222;
  border-right: 3px solid #222;
  border-top-right-radius: .5em;
  border-top-left-radius: .5em;
  overflow: hidden;
  padding: 0 2ex 0 .5ex;
}

nav ul li a:hover {
  text-decoration: none;
}

nav ul li:hover {
  background-color: #dfd;
}

footer {
  font-size: small;
  text-align: right;
}
