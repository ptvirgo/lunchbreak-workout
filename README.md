lunchbreak-workout
==============

A simple tool to generate workout missions in the spirit of  the book "Corps
Strength" by MGySgt Paul J. Roarke Jr. See www.corpsstrength.com for further
information.

# About

I wrote this tool in order to make my lunch breaks a little healthier,
as well as to demonstrate what I've been learning about Perl, SQL, Javascript
and git.


# Setup notes

In addition to the libraries, lib/Workout directory contains:

* Required database(s)
* exercise_tables.sql, which configures empty tables expected by the
  library and script.
* convert.pl:  point this at a '|' separated list of exercises and
  related data, and it will spit out the SQL statements to store them

If you wanted to establish your own collection of exercises, you could:

* Write a list of exercises.  See "purist.list" as an example of format.
* `perl convert.pl my_exercise.list > my_exercises.sql`
* `sqlite3 my_exercises.db < exercise_tables.sql`
* `sqlite3 my_exercises.db < my_exercises.sql`
* Edit Workout.pm and Workout/Exercise.pm to change the $data_file variable from
  'purist.db' to 'my_exercises.db'
