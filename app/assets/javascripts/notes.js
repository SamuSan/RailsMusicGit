window.Notes = new function(){
  var player_notes = [];

  function Note(position, duration, frequency) {
    this.position  = parseInt(position);
    this.duration  = duration;
    this.frequency = frequency;
  }
  //TODO this sucks sort it out to a 2 dim array and use some blank marker instead of undefined
  this.createNote = function(position, frequency) {
    if (player_notes[position] == undefined){
      var note = new Note(position, 1, frequency);
      player_notes[position] = note
    }
    else {
      note = player_notes[position];

      if (note.duration == 4){
        player_notes[position] = undefined;
  	  }
  	  else {
        note.duration++;
        player_notes[position] = note;
  	  }
    }
  }; 

  this.addNotesForCurrentCommit = function(notes_for_commit) {
    player_notes = [];
    _.each(notes_for_commit, function(notes) {
      _.each(notes, function(note){
        player_notes[note.position] = note;
      });
    });
  };

  this.notesInPlayer = function() { 
    return player_notes;
  };

  this.clearAll = function() {
    player_notes = [];
  };

  this.noteDurationAtPosition = function(position) {
    if(player_notes[position]){
      return player_notes[position].duration;
    }
    return 0;
  };
};