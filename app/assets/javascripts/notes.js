var player_notes = [];

function Note (position, duration, frequency) {
  this.position   = +position;//Parse int get rid of the + ya gypo! Not clear
  this.duration   = duration;
  this.frequency  = frequency;
}

function createNote (position, frequency){
  if(player_notes[position] == undefined){
    var note = new Note(position, 1, frequency);
    player_notes[position] = note
  }
  else{
    note = player_notes[position];

    if(note.duration == 4){
      player_notes[position] = undefined;
	  }
	  else{
      note.duration++;
      player_notes[position] = note;
	  }
  }
} 

function addNotesForCurrentCommit(notes_for_commit){
  notes = [];
  _.each(notes_for_commit, function(note){
    player_notes[note.position] = note;
  });
}