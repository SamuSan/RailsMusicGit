$(function() {
  $('.note_button').on('click', function(e){
    console.log(e.target);
    e.target.src = "app/assets/images/Button_on.png";
    console.log(e.target);
  });
});