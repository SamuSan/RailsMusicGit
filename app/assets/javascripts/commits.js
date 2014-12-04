var projectId;
var lastCommitId;

$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  lastCommitId = $("meta[property=lastCommitId]").attr("content");

  $.ajax({
    type: 'GET',
    url: '/projects/'+projectId+'/commits/'+ lastCommitId + '/notes'
  }).done(function(result){
      addNotesForCurrentCommit(result);  
  }).fail(function(error){
      console.log("An error occured" + error);
  });

  $('.commit_button').on('click', function(e){
    $.ajax({
    	type: 'POST',
    	url: '/projects/'+projectId+'/commits' ,
    	data: {"project_id": projectId,
    		     "notes" : JSON.stringify(player_notes),
    		     "parent_commit_id" : lastCommitId  }
    }).done(function(result){
      $("#commit-history").html(result);
    }).fail(function(error){
    	console.log(error);
		});	
  });
});
