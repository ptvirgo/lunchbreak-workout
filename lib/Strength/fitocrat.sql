BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Pull-Up',
    (SELECT id FROM class WHERE name = 'pull-up'),
    'http://youtu.be/6F-J_ElXpcU'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Pull-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Pull-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Wide-Grip Pull-Up',
    (SELECT id FROM class WHERE name = 'pull-up'),
    'http://youtu.be/Ie9vf6HYOL8'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wide-Grip Pull-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wide-Grip Pull-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Chin-Up',
    (SELECT id FROM class WHERE name = 'pull-up'),
    'http://youtu.be/BmecQ8xxLR4'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Chin-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Chin-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Close Grip Pull-Up',
    (SELECT id FROM class WHERE name = 'pull-up')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Close Grip Pull-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Close Grip Pull-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Push-Up',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/iXkuo9M9yhI'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Push-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Push-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Wide Arm Push-Up',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/9wT49ZdqxvE'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wide Arm Push-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Wide Arm Push-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Decline Push Up',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/XBxrFpZTOvU'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Decline Push Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Decline Push Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Diamond Push-Up',
    (SELECT id FROM class WHERE name = 'push-up'),
    'http://youtu.be/GZ4jq2fa9rQ'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Diamond Push-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Diamond Push-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Romanian Dumbbell Deadlift',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/O85Gz2M1Tv0'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Romanian Dumbbell Deadlift'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Kettlebell Deadlift',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/MrQYn4KVgp4'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Kettlebell Deadlift'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Goblet Squat',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/SATfB0s87ig'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Goblet Squat'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Goblet Squat'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Kettlebell Swing',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/0SemS2qh5Is'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Kettlebell Swing'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Dumbbell Overhead Press',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/lH5eU1vk9XM'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Dumbbell Overhead Press'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Push Press',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/BqMHSIyBP4E'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Push Press'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Push Press'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Dumbbell Bicep Curl',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/d6t-P_0Q5TI'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Dumbbell Bicep Curl'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'One-Arm Kettlebell Clean',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/Fn_L6dkmBQg'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'One-Arm Kettlebell Clean'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Hammer Dumbbell Curl',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/El9fbXdh-8w'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Hammer Dumbbell Curl'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Standing Dumbbell Upright Row',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/Vol9MoFquLc'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Standing Dumbbell Upright Row'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Front Dumbbell Raise',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/iL2YEipjE6Y'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Front Dumbbell Raise'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Triceps Extension',
    (SELECT id FROM class WHERE name = 'assist'),
    'http://youtu.be/M7wQTqw5rzE'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Triceps Extension'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Triceps Extension'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Neck Flexion',
    (SELECT id FROM class WHERE name = 'neck')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Neck Flexion'),
    (SELECT id FROM gear WHERE name = 'neck-harness')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Head Bridge',
    (SELECT id FROM class WHERE name = 'neck')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Head Bridge'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Body Weight Squat',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/PuxpZlMC4XA'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Body Weight Squat'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Body Weight Squat'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Step-Up',
    (SELECT id FROM class WHERE name = 'wheel-house'),
    'http://youtu.be/sZloQZykQjM'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Up'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Up'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Step-Up'),
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
    'Hand Gripper',
    (SELECT id FROM class WHERE name = 'grip')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Hand Gripper'),
    (SELECT id FROM gear WHERE name = 'gripper')
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
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Crunch',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/IyOCCLMUFJo'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Crunch'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Crunch'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Crunch'),
    (SELECT id FROM gear WHERE name = 'kettlebell')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Crunch'),
    (SELECT id FROM gear WHERE name = 'dumbbell')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Bicycle (abs)',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/WXrIkUEWUhw'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Bicycle (abs)'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Side Crunch',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/cYnx9bL9D9s'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Side Crunch'),
    (SELECT id FROM gear WHERE name = 'none')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Side Crunch'),
    (SELECT id FROM gear WHERE name = 'weight-vest')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Flat Leg Raise',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/O-rChkIovYE'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Flat Leg Raise'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class, url)
  VALUES (
    'Sit-Up',
    (SELECT id FROM class WHERE name = 'abs'),
    'http://youtu.be/ys7kyjOg1qc'
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Sit-Up'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Flutter Kicks',
    (SELECT id FROM class WHERE name = 'abs')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Flutter Kicks'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

BEGIN TRANSACTION;
  INSERT INTO exercises (name, class)
  VALUES (
    'Vertical Leg Crunch',
    (SELECT id FROM class WHERE name = 'abs')
  );

  INSERT INTO exercise_gear (exercise_id, gear_id)
  VALUES (
    (SELECT id FROM exercises WHERE name = 'Vertical Leg Crunch'),
    (SELECT id FROM gear WHERE name = 'none')
  );
END TRANSACTION;

