/*
  exerciseURL( exercise );
  Parameter: An exercise object
  Returns:
    If url is defined: '<a href="exercise.url">exercise.name</a>'
    If not: 'exercise.name'
*/

function exerciseURL( exercise ) {
  if ( typeof( exercise.url ) === 'undefined' ) {
    return exercise.name;
  } 

  return '<a href="' + exercise.url + '">' + exercise.name + '</a>';
}

/*
  displaySet( exercises );
  Parameter:  An array of exercise objects
  Returns: N/A
  Effect: Update $('#workout').html with an ordered list of the exercises
*/

function displaySet( exercises ) {

  var exerciseList = '';

  if ( exercises.length === 6 ) {
    exerciseList = '<ol>' +
                   '<li>' + exerciseURL( exercises[0] ) + ' (10 x 3 ) ' +
                   exerciseURL( exercises[1] ) + ' (25 x 3) ' +
                   exerciseURL( exercises[2] ) + ' (50 x 3)</li>' +
                   '<li>' + exerciseURL( exercises[3] ) + ' (25 x 3 ) ' +
                   exerciseURL( exercises[4] ) + ' (25 x 3) ' +
                   exerciseURL( exercises[5] ) + ' (50 x 3)</li>' +
                   '</ol>';
    $('#workout').html( exerciseList );
    return;
  }

  if ( exercises.length === 8 ) {
    exerciseList = '<ol>' +
                   '<li>' + exerciseURL( exercises[0] ) + ' (10 x 3), ' +
                   'alternate with ' + exerciseURL( exercises[1] ) + ' ' +
                   '(25 x 3)</li>' +
                   '<li>' + exerciseURL( exercises[2] ) + ' (10-15 x 3), ' +
                   'alternate with ' + exerciseURL( exercises[3] ) + ' ' +
                   '(50 x 3)</li>' +
                   '<li>' + exerciseURL( exercises[4] ) + ' (10-15 x 3), ' +
                   'alternate with ' + exerciseURL( exercises[5] ) + ' ' +
                   '(50 x 3)</li>' +
                   '<li>' + exerciseURL( exercises[6] ) + ' (max x 2), ' +
                   'alternate with ' + exerciseURL( exercises[7] ) + ' ' +
                   '(50)</li>' +
                   '</ol>';

    $('#workout').html( exerciseList );
    return;
  }

  var exerciseList = '<ol>';
  for ( var i = 0; i < exercises.length; i++ ) {
    exerciseList += '<li>' + exerciseURL( exercises[i] ) + '</li>';
  }

  $('#workout').html( exerciseList );
}

$('#kettlebell').click( function() {

  var smallJoint = ( Math.floor( Math.random() * 3 ) < 1 )
    ? 'neck'
    : 'grip';

  var focus = 'pull-up,push-up,wheel-house,abs,assist,abs,' + smallJoint + ',abs';

  $.get( '/api/workout', { 'gear':'kettlebell,none', 'focus': focus },
    function ( data, status ) {
      var workout = $.parseJSON( data );
      displaySet( workout );
  });

  $('#title').text('Kettlebell Mission');
  $('#content').text('Get your cardio up, then do your best to complete the exercise sets below.');
});

$('#calisthenics').click( function() {
  var focus = 'pull-up,push-up,abs,wheel-house,wheel-house,abs';

  $.get( '/api/workout', { 'gear':'none', 'focus': focus },
    function ( data, status ) {
      var workout = $.parseJSON( data );
      displaySet( workout );
  });

  $('#title').text('Calisthenics Mission');
  $('#content').text('Get your cardio up, then do your best to complete the exercise sets below.');
});

$('#dumbbell').click( function() {

  var smallJoint = ( Math.floor( Math.random() * 3 ) < 1 )
    ? 'neck'
    : 'grip';

  var focus = 'pull-up,push-up,wheel-house,abs,assist,abs,' + smallJoint + ',abs';

  $.get( '/api/workout', { 'gear':'dumbbell,none', 'focus': focus },
    function ( data, status ) {
      var workout = $.parseJSON( data );
      displaySet( workout );
  });

  $('#title').text('Dumbbell Mission');
  $('#content').text('Get your cardio up, then do your best to complete the exercise sets below.');
});
