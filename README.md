corps-strength
==============

A simple tool to generate workout missions in accordance with the book "Corps
Strength" by MGySgt Paul J. Roarke Jr. See www.corpsstrength.com for further
information.

I am in no way associated with the author, though he seems pretty cool.

# About

This is a very simple command line script.  I wrote it to learn a bit about SQL
and relational databases, as well as make my lunch breaks healthier.

The Corps Strength version is intended to be fairly strict
interpretation of the routine format specified in the original book.  It
is easy to imagine a more generalized routine generator providing for
more varied personal preferences.  If I try my hand at that, it will be
on a fork to keep the purist in me happy.

# Setup notes

In addition to the libraries, lib/Workout directory contains:

* Required database(s)
* exercise_tables.sql, which configures empty tables expected by the
  library and script.
* convert.pl:  point this at a '|' separated list of exercises and
  related data, and it will spit out the SQL statements to store them

If you wanted to establish your own collection of exercise, you could:

* Write a list of exercises.  See "purist.list" as an example of format.
* `perl convert.pl my_exercise.list > my_exercises.sql`
* `sqlite3 my_exercises.db < exercise_tables.sql`
* `sqlite3 my_exercises.db < my_exercises.sql`
* Edit Workout.pm and Workout/Exercise.pm to change the $data_file variable from
  'purist.db' to 'my_exercises.db'

# URLS

You may note that the exercise database includes urls. Ostensibly, they
can lead to demonstrations of each exercise, but are not displayed by
the script.  This might be changed later, or I may reserve their use for
a web-based version.
