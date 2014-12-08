var projectId;
var lastCommitId;
var lastCommitNumber;
var currentCommitNumber;

$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  lastCommitId = $("meta[property=lastCommitId]").attr("content");
  lastCommitNumber = $("meta[property=lastCommitNumber]").attr("content");
  currentCommitId = lastCommitId;
  currentCommitNumber = lastCommitNumber;

  getNotesForCommit(currentCommitNumber);

  $('.commit_button').on('click', function(e){
    $.ajax({
    	type: 'POST',
    	url: '/projects/'+projectId+'/commits' ,
    	data: {"project_id": projectId,
    		     "notes" : JSON.stringify(player_notes)
      }
    }).done(function(result){
      $("#commit-history").html(result);
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

function getNotesForCommit(commitNumber){
  player_notes = [];
  $.ajax({
    type: 'GET',
    url: '/projects/'+projectId+'/commits/' + lastCommitId,
    data: {"commit_number" : commitNumber, "project_id" : projectId}
  }).done(function(result){
    console.log(result)
      addNotesForCurrentCommit(result);
      updateCommitsLabel();
      render_grid();
  }).fail(function(error){
      console.log("An error occured" + error);
  });
}

function updateCommitsLabel(){
  $('.controls_commits_label').text("Current Commit: " + (parseInt(currentCommitNumber)));
}