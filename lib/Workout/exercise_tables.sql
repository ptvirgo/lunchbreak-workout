PRAGMA foreign_keys = ON;

CREATE TABLE gear
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT UNIQUE NOT NULL 
);

CREATE TABLE focus
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE exercise
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT UNIQUE NOT NULL,
  focus INTEGER NOT NULL,
  url TEXT
);

CREATE TABLE exercise_gear
(
  exercise_id INTEGER NOT NULL,
  gear_id INTEGER NOT NULL,
  FOREIGN KEY(exercise_id) REFERENCES exercise(id) ON DELETE CASCADE,
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
  INSERT INTO focus (name) VALUES ('pull-up');
  INSERT INTO focus (name) VALUES ('push-up');
  INSERT INTO focus (name) VALUES ('wheel-house');
  INSERT INTO focus (name) VALUES ('abs');
  INSERT INTO focus (name) VALUES ('assist');
  INSERT INTO focus (name) VALUES ('grip');
  INSERT INTO focus (name) VALUES ('neck');
END TRANSACTION;
