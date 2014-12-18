var projectId;
var branchHeadId;
var currentCommit;
var currentCommitId;
var currentCommitNumber;
var currentBranchId;

$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  currentCommitId = $("meta[property=currentCommitId]").attr("content");
  currentBranchId = $("meta[property=currentBranchId]").attr("content");
  branchHeadId = parseInt(currentCommitId);

  getNotesForCommit(currentCommitId);

  $('.commit_button').on('click', function(e){
    if(canCommit()){
      $.ajax({
      	type: 'POST',
      	url: '/projects/'+ projectId + '/branches/' + currentBranchId +'/commits' ,
      	data: { "notes" : JSON.stringify(Notes.notesInPlayer()),
                "comments" : $('#commit_comments').val(),
                "current_commit_id" : currentCommit.id 
              }
      }).done(function(result){
        $('#new_commit_comments').val('');
        currentCommit = new Commit(result.commit);
        branchHeadId = currentCommit.id;
        updateCommitsLabel();
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
      getNotesForCommit(currentCommitId)   
    }
  });

  $('.back_button').on('click', function(){
    if(currentCommit.number - 1 > 0){
      getNotesForCommit(currentCommit.parent_commit_id)   
    }
  });    
});

function getNotesForCommit(id){
  player_notes = [];
  $.ajax({
    type: 'GET',
    url: '/projects/'+ projectId + '/branches/' + currentBranchId +   '/commits/' + id
  }).done(function(result){
      currentCommit = new Commit(result.commit);
      Notes.addNotesForCurrentCommit(currentCommit.notes);
      updateCommitsLabel();
      Player.renderGrid();
  }).fail(function(error){
      console.log("An error occured" + error);
  });
}

function updateCommitsLabel(){
  $('.controls_commits_span').text((parseInt(currentCommit.number)));
}

function canCommit() {
  return currentCommit.id == branchHeadId;
}
function notifyUserBranchNeeded() {
  $('#create_branch_prompt_div').addClass('warning_paragraph_visible').removeClass('warning_paragraph_hidden')
  $('#new_branch_name').focus();
  $('#warning_div').addClass('warning_paragraph_visible').removeClass('warning_paragraph_hidden');
}