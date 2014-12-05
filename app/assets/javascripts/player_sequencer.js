
var beat;
var eightOhEight;
$(function(){
  eightOhEight = new DrumMachine();
});

function runSequencer(){
  prepareNotesArray(player_notes);
  // eightOhEight.play();
}

function stopSequencer(){
  console.log("Stop");
}

function prepareNotesArray(player_notes){
  var notesSortedForBuffers = [];
  console.log(player_notes);
  for (var i = 0; i <= 144; i+=16) {
    console.log("" + i + "/// " + (i + 17))
    sliced = player_notes.slice(i,(i + 16));
    notesSortedForBuffers.push(sliced);
  }
  _.each(notesSortedForBuffers, function(arr){
      console.log(arr.length);

  });
  console.log(notesSortedForBuffers);
    console.log("Moinkeys");
}

