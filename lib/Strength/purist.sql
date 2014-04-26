BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Regular Pull-Ups',
    (SELECT id FROM class WHERE name = 'pull-up'),
    'http://youtu.be/6F-J_ElXpcU'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Regular Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Regular Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Behind-the-Neck Pull-Ups',
    (SELECT id FROM class WHERE name = 'pull-up')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Behind-the-Neck Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Behind-the-Neck Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Chin-Ups',
    (SELECT id FROM class WHERE name = 'pull-up'),
    'http://youtu.be/BmecQ8xxLR4'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Chin-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Chin-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Close-Grip Pull-Ups',
    (SELECT id FROM class WHERE name = 'pull-up'),
    'http://youtu.be/y7dY2Qrf-9w'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Close-Grip Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Close-Grip Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Commando Pull-Ups',
    (SELECT id FROM class WHERE name = 'pull-up'),
    'http://youtu.be/nv0IUiVjMEo'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Commando Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Commando Pull-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'V-Ups',
    (SELECT id FROM class WHERE name = 'pull-up')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'V-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'V-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Regular Push-Ups',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/iXkuo9M9yhI'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Regular Push-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Regular Push-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Wide Push-Ups',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/9wT49ZdqxvE'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wide Push-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wide Push-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Incline Push-Ups',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/HRZqXzaC6OI'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Incline Push-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Incline Push-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Diamond Push-up',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/GZ4jq2fa9rQ'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Diamond Push-up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Diamond Push-up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Mountain Climber Push-Ups',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/9hmYWaW--Nw'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Mountain Climber Push-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Mountain Climber Push-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Deadlift Curl',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/E5caAjVfKNM'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Deadlift Curl'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Squat Press',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://www.youtube.com/watch?v=72Sjt_abQxU&feature=youtu.be&t=1m8s'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Squat Press'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Squat Press'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Step-Up Shrug',
    (SELECT id FROM class WHERE name = 'wheel-house')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Up Shrug'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Up Shrug'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Lateral Swing',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/gPX5bT6kI7k'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Lateral Swing'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Lateral Swing'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Rowing (One-Arm)',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/JjL74p0-V70'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Rowing (One-Arm)'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Rowing (One-Arm)'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Rowing (Two-Arm)',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/XhaUBljZGi4'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Rowing (Two-Arm)'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Rowing (Two-Arm)'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Overhead Press',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/UxnSP7t9ZlI'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Overhead Press'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Overhead Press'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Curls',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/d6t-P_0Q5TI'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Curls'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Curls'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Hammer Curls',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/3lqnHzGi7fA'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Hammer Curls'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Hammer Curls'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Upright Row',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/Vol9MoFquLc'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Upright Row'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Upright Row'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Front Raise',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/iL2YEipjE6Y'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Front Raise'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Front Raise'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Triceps Press',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/M7wQTqw5rzE'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Triceps Press'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Triceps Press'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Neck Bridges',
    (SELECT id FROM class WHERE name = 'neck'),
    'http://youtu.be/7Mb7Y-U-og8'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Neck Bridges'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Neck Curls',
    (SELECT id FROM class WHERE name = 'neck'),
    'http://youtu.be/JAZ8Q2jbdHw?t=42s'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Neck Curls'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Neck Curls'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Neck Curls'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Neck Harness',
    (SELECT id FROM class WHERE name = 'neck')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Neck Harness'),
    (SELECT id FROM gear WHERE name = 'neck-harness')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    '8 Counts',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/1f8HNQ0kn0I'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = '8 Counts'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = '8 Counts'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Free Squats',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/PuxpZlMC4XA'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Free Squats'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Free Squats'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Step-Ups',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/sZloQZykQjM'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Ups'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Ups'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Ups'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Ups'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Mountain Climbers',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/Bdg9WWh2Fos'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Mountain Climbers'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Mountain Climbers'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Wrist Curls',
    (SELECT id FROM class WHERE name = 'grip')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wrist Curls'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wrist Curls'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Gripper',
    (SELECT id FROM class WHERE name = 'grip')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Gripper'),
    (SELECT id FROM gear WHERE name = 'gripper')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Regular Crunch',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/IyOCCLMUFJo'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Regular Crunch'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Regular Crunch'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Flutter Kicks',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/RcXBNRua2eo'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Flutter Kicks'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Elevated Crunch',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/iAFdJQ_pFfk'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Elevated Crunch'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Hello Dollies',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/stI57f5U2pA'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Hello Dollies'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Side Crunches',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/lApy21lTjQQ'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Side Crunches'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Side Crunches'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Leg Lifts',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/O-rChkIovYE'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Leg Lifts'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Reach Crunches',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/eazQpjRjy2U'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Reach Crunches'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

