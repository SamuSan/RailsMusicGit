var colors = [0,1,2,3,4];
var index = 0;
$(function() {
  $('.note_button').on('click', function(e){
		e.target.src = "../assets/button_"+ colors[index] +".png";
		index != 4 ? index++ : index = 0;

$.ajax({
	url: "/notes",
	type: "POST"});




  });
});