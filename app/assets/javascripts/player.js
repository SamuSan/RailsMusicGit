$(function() {
  $('.note_button').on('click', function(e){
    createNote(e.target.dataset["position"], 335.65);
    render_grid();  
  });

  $('.btn-commit_history').on('click', function(e){
    console.log("Goodlordbabyjaysus");
  });  
});

function render_grid(){
  var buttons = $('.note_button');
  _.each(buttons, function(button){
    button.src = image_for_button(button.dataset["position"]);
  });
}

function image_for_button(position){
  image_id = player_notes[position] == undefined ? "0" : player_notes[position].duration; 
  return "../assets/button_"+ image_id +".png";
}