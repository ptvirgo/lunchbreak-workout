PRAGMA foreign_keys = ON;

CREATE TABLE gear
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT UNIQUE NOT NULL 
);

CREATE TABLE class
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE exercises
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT UNIQUE NOT NULL,
  class INTEGER NOT NULL,
  url TEXT
);

CREATE TABLE exercise_gear
(
  exercise_id INTEGER NOT NULL,
  gear_id INTEGER NOT NULL,
  FOREIGN KEY(exercise_id) REFERENCES exercises(id) ON DELETE CASCADE,
  FOREIGN KEY(gear_id) REFERENCES gear(id) ON DELETE CASCADE
);

BEGIN TRANSACTION;
  INSERT INTO gear (name) VALUES ('none');
  INSERT INTO gear (name) VALUES ('weight-vest');
  INSERT INTO gear (name) VALUES ('kettlebell');
  INSERT INTO gear (name) VALUES ('dumbbell');
  INSERT INTO gear (name) VALUES ('neck-harness');
  INSERT INTO gear (name) VALUES ('gripper');
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO class (name) VALUES ('pull-up');
  INSERT INTO class (name) VALUES ('push-up');
  INSERT INTO class (name) VALUES ('wheel-house');
  INSERT INTO class (name) VALUES ('abs');
  INSERT INTO class (name) VALUES ('assist');
  INSERT INTO class (name) VALUES ('grip');
  INSERT INTO class (name) VALUES ('neck');
END TRANSACTION;
