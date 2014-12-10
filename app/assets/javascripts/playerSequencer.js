window.PlayerSequencer = new function() {
  this.runSequencer = function() {
    DrumMachine.play(); 
  };

  this.stopSequencer = function() {
    DrumMachine.stopPlaying();
  };

  this.prepareNotesArray = function(playerNotes) {
    var notesSortedForBuffers = [];
    for (var i = 0; i <= 144; i += 16) {
      sliced = playerNotes.slice(i, i + 16);
      notesSortedForBuffers.push(_.compact(sliced));
    }
    return notesSortedForBuffers;
  };
};