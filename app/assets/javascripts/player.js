var SPACE_BAR = 32;
var ENTER     = 13;

window.Player = new function(){
  $(function() {
    $('.note_button').on('click', function(e) {
      Notes.createNote(e.target.dataset["position"], 335.65);
      render();  
    });

    $('.play_button').on('click', function(e) {
      PlayerSequencer.runSequencer();
    });

    $('.stop_button').on('click', function(e) {
      PlayerSequencer.stopSequencer();
    });

    $('.clear_all_button').on('click', function(e) {
      Notes.clearAll();
      render();
    });

    $(document).keypress(function(e) {
      if(e.which == SPACE_BAR && !DrumMachine.isPlaying()) {
        $('.play_button').click();
      }else if (e.which == SPACE_BAR && DrumMachine.isPlaying()) { 
        $('.stop_button').click();
      }
      else if (e.which == ENTER){
        $('.add_branch_button').click();
      }
    }); 
  });

  this.renderGrid = function() {
    render();
  };

  function render() {
    var buttons = $('.note_button');
    _.each(buttons, function(button) {
      button.src = imageForButton(button.dataset["position"]);
    });
  };

  function imageForButton(position) {
    image_id = Notes.noteDurationAtPosition(position);
    return "../assets/button_"+ image_id +".png";
  };
}