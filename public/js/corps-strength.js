/*
  exerciseURL( exercise );
  Parameter: An exercise object
  Returns:
    If url is defined: '<a href="exercise.url">exercise.name</a>'
    If not: 'exercise.name'
*/

function exerciseURL( exercise ) {
  if ( typeof( exercise.url ) === 'undefined' || exercise.url === null ) {
    return exercise.name;
  } 

  return '<a href="' + exercise.url + '">' + exercise.name + '</a>';
}

/*
  listSet( exercises );
  Parameter:  An array of exercise objects
  Returns: HTML string of exercises
*/

function listSet( exercises ) {

  var exerciseList = '';

  if ( exercises.length === 3 ) {
    exerciseList = '<ol>' +
      '<li>Repeat 3x: ' + exerciseURL( exercises[0] ) + ' (15), ' +
      exerciseURL( exercises[1] ) + ' (15), ' +
      exerciseURL( exercises[2] ) + ' (50)' + '</ol>';
    return exerciseList;
  }

  if ( exercises.length === 6 ) {
    exerciseList = '<ol>' +
                   '<li>Repeat 3x: ' + exerciseURL( exercises[0] ) + ' (10), ' +
                   exerciseURL( exercises[1] ) + ' (25), ' +
                   exerciseURL( exercises[2] ) + ' (50)</li>' +
                   '<li>Repeat 3x: ' + exerciseURL( exercises[3] ) + ' (25), ' +
                   exerciseURL( exercises[4] ) + ' (25), ' +
                   exerciseURL( exercises[5] ) + ' (50)</li>' +
                   '</ol>';
    return exerciseList;
  }

  if ( exercises.length === 8 ) {
    exerciseList = '<ol>' +
                   '<li>Repeat 3x: ' + exerciseURL( exercises[0] ) + ' (10), ' +
                   exerciseURL( exercises[1] ) + ' ' + '(25)</li>' +
                   '<li>Repeat 3x: ' + exerciseURL( exercises[2] ) + ' (10-15), ' +
                   exerciseURL( exercises[3] ) + ' ' + '(50)</li>' +
                   '<li>Repeat 3x: ' + exerciseURL( exercises[4] ) + ' (10-15), ' +
                   exerciseURL( exercises[5] ) + ' (50)</li>' +
                   '<li>' + exerciseURL( exercises[6] ) + ' (max, 2x), ' +
                   exerciseURL( exercises[7] ) + ' ' + '(50)</li>' +
                   '</ol>';

    return exerciseList;
  }

  var exerciseList = '<ol>';
  for ( var i = 0; i < exercises.length; i++ ) {
    exerciseList += '<li>' + exerciseURL( exercises[i] ) + '</li>';
  }

  return exerciseList;
}

function reScale( base, max )
{
    var scale = 1;

    var pageWidth = "innerWidth" in window
        ? window.innerHeight
        : document.documentElement.offsetHeight;

    if (pageWidth > max)
    {
      pageWidth = max;
    }

    scale = pageWidth / base;
    return scale;
}

function GoButton() {
  this.clocks = [];
  this.equipment = [];
}

GoButton.prototype.showPlan = function() {
  var plan = this.activeClock.desc + ', ' + this.activeGear.desc + '.';
  $('#workout-plan').text(plan);
};

GoButton.prototype.getWorkout = function() {

  var smallJoint = ( Math.floor( Math.random() * 3 ) < 1 )
    ? 'neck'
    : 'grip';

  var bodyWeight = ( Math.floor( Math.random() * 3 ) < 1 )
    ? 'wheel-house'
    : 'push-up';

  var timeFocus = {
    '1h': {
      'default': 'pull-up,push-up,wheel-house,abs,assist,abs,' + smallJoint + ',abs', 
      'none': 'pull-up,push-up,abs,wheel-house,wheel-house,abs'
    },

    '15m': {
      'default': 'assist,' + bodyWeight + ',abs',
      'none': 'push-up,wheel-house,abs'
    }
  };

  time = this.activeClock.id;
  gear = this.activeGear.id;

  var workoutFocus;

  workoutFocus = timeFocus[ time ][ gear ];

  if ( typeof( workoutFocus ) === 'undefined')
  {
    workoutFocus = timeFocus[ time ]['default'];
  }

  $.get( '/api/workout', { 'gear': gear + ',none', 'focus': workoutFocus },
    function ( data, status ) {
      var exercises = $.parseJSON( data );
      var workout = listSet( exercises );
      $('#content').html( workout );
  });

};


GoButton.prototype.addClock = function( clock, id, desc ) {

  clock.id = id;
  clock.desc = desc;

  clocks = this.clocks;
  clocks.push( clock );

  showPlan = this.showPlan;
  getWorkout = this.getWorkout;

  var active = 0;
  this.activeClock = clocks[active];

  var reset = new Snap.Matrix();
  var buttonLeft = new Snap.Matrix();
  buttonLeft.translate( 3, 1 ).scale( .2, .2 );

  function iconify( clock ) {
    clock.transform( buttonLeft );
    clock.attr( {'display': 'inline' } );
    clock.click( function(){
      active = redraw();
      showPlan();
    });
  }

  function center( clock ) {
    this.activeClock = clock;
    clock.transform( reset );
    clock.attr( {'display': 'inline' } );
    clock.unclick();
    clock.click( function() { getWorkout(); } );
  }

  function hide( clock ) {
    clock.attr( {'display': 'none' } );
    clock.unclick();
  }

  function redraw() {

    next = ( active + 1 ) % clocks.length;

    for ( i = 0; i < clocks.length; i++ ) {
      hide( clocks[i] );
    }

    center( clocks[active] );
    iconify( clocks[next] );

    return next;
  }

  active = redraw();
  return clocks;
};

GoButton.prototype.addEquipment = function( gear, id, desc, centerPosition, iconPosition ) {

  gear.id = id;
  gear.desc = desc;
  gear.center = centerPosition;
  gear.icon = iconPosition;

  equipment = this.equipment;
  equipment.push( gear );

  var active = 0;
  this.activeGear = equipment[active];

  showPlan = this.showPlan;
  getWorkout = this.getWorkout;

  var centerStyle = {
    'display': 'inline',
    'fill': 'ffffff',
    'fillOpacity': .97
  };

  var iconStyle = {
    'display': 'inline',
    'fill': '224466',
    'fillOpacity': 1.00
  };
  
  var hideStyle = {'display': 'none'};

  function iconify( gear ) {
    gear.transform( gear.icon );
    gear.attr( iconStyle );
    gear.click( function(){
      active = redraw();
      showPlan();
    });
  }

  function center( gear ) {
    this.activeGear = gear;
    gear.transform( gear.center );
    gear.attr( centerStyle );
    gear.unclick();
    gear.click( function() { getWorkout(); } );
  }

  function hide( gear ) {
    gear.attr( hideStyle );
    gear.unclick();
  }

  function redraw() {

    next = ( active + 1 ) % equipment.length;

    for ( i = 0; i < equipment.length; i++ ) {
      hide( equipment[i] );
    }

    center( equipment[active] );
    iconify( equipment[next] );
    return next;
  }

  active = redraw();
  return equipment;
}

var s = Snap('#interface');
Snap.load('/images/icons.svg', function(iface) {

  var g = s.g();
  var button = new GoButton();

  var clock1h = iface.select( '#clock1h' );
  button.addClock( clock1h, '1h', 'Give me an hour' );

  var clock15m = iface.select( '#clock15m' );
  button.addClock( clock15m, '15m', 'About fifteen minutes' );

  var buttonRight = new Snap.Matrix();
  buttonRight.translate( 48, 0 ).scale( .2, .2 );

  var centerIconA = new Snap.Matrix();
  centerIconA.translate( 13, 13 ).scale( .6, .6 );

  var centerIconB = new Snap.Matrix();
  centerIconB.translate( 7, 9 ).scale( .7, .7 );

  var kettlebell = iface.select( '#kettlebell' );
  button.addEquipment( kettlebell, 'kettlebell', 'include kettlebell exercises',
    centerIconA, buttonRight );

  var dumbbell = iface.select( '#dumbbell' );
  button.addEquipment( dumbbell, 'dumbbell', 'include dumbbell exercises',
    centerIconA, buttonRight );

  var arm = iface.select( '#arm' );
  button.addEquipment( arm, 'none', 'only using bodyweight exercises',
    centerIconB, buttonRight );

  button.showPlan();

  var icons = [clock1h, clock15m, kettlebell, dumbbell, arm];

  for ( i=0; i < icons.length; i++ )
  {
    g.append( icons[i] );
  }

  var scale = reScale(64, 500);

  var iFace = document.getElementById("interface");
  iFace.style.height = ( 64 * scale ) + "px";
  iFace.style.width = ( 64 * scale ) + "px";

  var pageSize = new Snap.Matrix();
  pageSize.scale( scale, scale, 0, 0)

  g.transform( pageSize );

  s.append(g);
});
