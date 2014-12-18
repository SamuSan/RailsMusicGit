var projectId;
var branchHeadId;
var currentCommitId;
var currentCommitNumber;
var currentBranchId;

$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  currentCommitId = $("meta[property=currentCommitId]").attr("content");
  currentBranchId = $("meta[property=currentBranchId]").attr("content");
  branchHeadId = parseInt(currentCommitId);

  getNotesForCommit(currentCommitId, {});

  $('.commit_button').on('click', function(e){
    if(canCommit()){
      $.ajax({
      	type: 'POST',
      	url: '/projects/'+ projectId + '/branches/' + currentBranchId +'/commits' ,
      	data: { "notes" : JSON.stringify(Notes.notesInPlayer()),
                "comments" : $('#commit_comments').val(),
                "current_commit_id" : currentCommitId }
      }).done(function(result){
        $('#new_commit_comments').val('');
        currentCommitId = result.commit.id;
        branchHeadId = currentCommitId;
        currentCommitNumber = parseInt(result.commit.number);
        updateCommitsLabel(currentCommitNumber);
      }).fail(function(error){
      	console.log(error);
  		});	
    }
    else{
      notifyUserBranchNeeded();
    }
  });

  $('.forward_button').on('click', function(){
    if(currentCommitNumber + 1 < 100000){//Fix this shit it is not ok
      index = currentCommitNumber + 1;
      getNotesForCommit(currentCommitId, {"index" : index})   
    }
  });

  $('.back_button').on('click', function(){
    if(currentCommitNumber - 1 > 0){
      index = currentCommitNumber - 1;
      getNotesForCommit(currentCommitId, {"index" : index})   
    }
  });    
});

function getNotesForCommit(id, data){
  player_notes = [];
  $.ajax({
    type: 'GET',
    url: '/projects/'+ projectId + '/branches/' + currentBranchId +   '/commits/' + id,
    data: data 
  }).done(function(result){
      Notes.addNotesForCurrentCommit(result.commit.notes);
      currentCommitId = result.commit.id;
      currentCommitNumber = parseInt(result.commit.number);
      updateCommitsLabel(currentCommitNumber);
      Player.renderGrid();
  }).fail(function(error){
      console.log("An error occured" + error);
  });
}

function updateCommitsLabel(commitNumber){
  $('.controls_commits_span').text((parseInt(commitNumber)));
}

function canCommit() {
  return currentCommitId == branchHeadId;
}
function notifyUserBranchNeeded() {
  $('#create_branch_prompt_div').addClass('warning_paragraph_visible').removeClass('warning_paragraph_hidden')
  $('#new_branch_name').focus();
  $('#warning_div').addClass('warning_paragraph_visible').removeClass('warning_paragraph_hidden');
}