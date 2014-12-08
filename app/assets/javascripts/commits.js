var projectId;
var lastCommitId;
var currentCommitId;

$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  lastCommitId = $("meta[property=lastCommitId]").attr("content");
  currentCommitId = lastCommitId;

  getNotesForCurrentCommit(currentCommitId);

  $('.commit_button').on('click', function(e){
    $.ajax({
    	type: 'POST',
    	url: '/projects/'+projectId+'/commits' ,
    	data: {"project_id": projectId,
    		     "notes" : JSON.stringify(player_notes),
    		     "parent_commit_id" : lastCommitId  }
    }).done(function(result){
      currentCommitId = lastCommitId;
      updateCommitsLabel();
      $("#commit-history").html(result);
    }).fail(function(error){
    	console.log(error);
		});	
  });

  $('.forward_button').on('click', function(){
    console.log("FORWARD SPOT");
    if (currentCommitId != lastCommitId) {
      currentCommitId++;
      getNotesForCurrentCommit(currentCommitId);
    };
  });

  $('.back_button').on('click', function(){
    console.log("BACKWARD SPOT");
    if (currentCommitId > 1) {
      currentCommitId--;
      getNotesForCurrentCommit(currentCommitId);
    };
  });    
});

function getNotesForCurrentCommit(commitId){
  $.ajax({
    type: 'GET',
    url: '/projects/'+projectId+'/commits/'+ commitId + '/notes'
  }).done(function(result){
    console.log(result);
      addNotesForCurrentCommit(result);
      updateCommitsLabel();
      render_grid();
  }).fail(function(error){
      console.log("An error occured" + error);
  });
}

function updateCommitsLabel(){
  console.log("Updfating the labels")
  $('.controls_commits_label').text("Current Commit: " + currentCommitId);
}