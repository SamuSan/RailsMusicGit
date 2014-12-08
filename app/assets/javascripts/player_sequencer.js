
var beat;
var eightOhEight;

$(function(){
  eightOhEight = new DrumMachine();
});

function runSequencer(){
  eightOhEight.play(prepareNotesArray(player_notes));
}

function stopSequencer(){
  console.log("Stop");
}

function prepareNotesArray(player_notes){
  var notesSortedForBuffers = [];
  console.log(player_notes);
  for (var i = 0; i <= 144; i+=16) {
    sliced = player_notes.slice(i,(i + 16));
    sliced.forEach(function(note){
      note.position = note.position % 16;
    })
    notesSortedForBuffers.push(_.compact(sliced));
  }
  return notesSortedForBuffers;
}

