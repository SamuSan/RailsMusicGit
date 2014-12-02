var notes = [];
var colors = [0,1,2,3,4];
var index = 1;
var baseLength = 2;

$(function() {
  $('.note_button').on('click', function(e){
    createNote(e.target.id, duration(index), 330.30);

		e.target.src = "../assets/button_"+ colors[index] +".png";
		index != 4 ? index++ : index = 0;
    });
});

function duration(index){
  return baseLength + ((index-1) * 2);
}

function Note (id, duration, frequency) {
  this.id         = id;
  this.duration   = duration;
  this.frequency  = frequency;
}



function createNote (id, duration, frequency){
  var note = new Note(id, duration, frequency);
  var exists = _.find(notes, function(n){
    return n.id = id;
  });

  if(duration == 0 && exists != undefined ){
    notes.splice(notes.indexOf(exists), 1);
  }
  else if (exists != undefined) {
    var changeNote = new Note(id, duration, frequency);
    notes[notes.indexOf(exists)] = changeNote;
  } 
  else{
    notes.push(note);
  }
    console.log(notes)
} 