var projectId;
var currentCommitId;
var currentBranchId;

$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  currentCommitId = $("meta[property=currentCommitId]").attr("content");
  currentBranchId = $("meta[property=currentBranchId]").attr("content");


  getNotesForCommit(currentCommitId);

  $('.commit_button').on('click', function(e){
    $.ajax({
    	type: 'POST',
    	url: '/projects/'+ projectId + '/branches/' + currentBranchId +'/commits' ,
    	data: { "notes" : JSON.stringify(Notes.notesInPlayer()) }
    }).done(function(result){
      $("#project_management_div").html(result);
      updateCommitsLabel();
    }).fail(function(error){
    	console.log(error);
		});	
  });

  $('.forward_button').on('click', function(){
    console.log("FORWARD SPOT");
    if (currentCommitNumber != lastCommitNumber) {
      currentCommitNumber++;
      getNotesForCommit(currentCommitNumber);
    };
  });

  $('.back_button').on('click', function(){
    console.log("BACKWARD SPOT");
    if (currentCommitNumber > 1) {
      currentCommitNumber--;
      getNotesForCommit(currentCommitNumber);
    };
  });    
});

function getNotesForCommit(id){
  player_notes = [];
  $.ajax({
    type: 'GET',
    url: '/projects/'+ projectId + '/branches/' + currentBranchId +   '/commits/' + id 
  }).done(function(result){
    console.log(result)
      Notes.addNotesForCurrentCommit(result["commit"]["notes"]);
      updateCommitsLabel(); //arg
      Player.renderGrid();
  }).fail(function(error){
      console.log("An error occured" + error);
  });
}

function updateCommitsLabel(){
  // $('.controls_commits_span').text("Current Commit: " + (parseInt(currentCommitNumber)));
}