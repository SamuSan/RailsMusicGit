var currentBranch;
$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  currentCommitId = $("meta[property=currentCommitId]").attr("content");
  currentBranchId = $("meta[property=currentBranchId]").attr("content");

  loadBranch(currentBranchId);

  $('.add_branch_button').on('click', function() {
    if($('#new_branch_name').val()) {
      $.ajax({
        type: 'POST',
        url: '/projects/'+ projectId + '/branches',
        data: { "branch" : { "current_commit_id" : currentCommit.id,
                              "name" : $('#new_branch_name').val(),
                              "commit" : {
                                "notes" : JSON.stringify(Notes.notesInPlayer()),
                                "comments" : $('#commit_comments').val(),
                                "current_commit_id" : currentCommit.id
                              }
                            }

              }
      }).done(function(result){
        currentBranch = new Branch(result.branch);
        resetWarnings();
        updateBranchDisplay();
        updateCommitsLabel();
      }).fail(function(error){
        console.log(error);
      });
    }
    else{
        setWarnings();
    };
  });

  $('#new_branch_name').on('click', function(){
    $('#new_branch_name').removeClass('warning');
  });
  $('#branchSelector').on('click', 'li', function(e){
    var branchId = parseInt(e.currentTarget.dataset.id);
    loadBranch(branchId);
  });
});

function loadBranch(id) {
  console.log("ASFDJKHASDJKHGASDKJHG" + +id)
  $.ajax({
    type: 'GET',
    url: '/projects/'+ projectId + '/branches/' + id
  }).done(function(result){
      currentBranch = new Branch(result.branch);
      updateBranchDisplay();
  }).fail(function(error){
      console.log(error);
  });
}

function getCurrentBranchName(id) {
  $.ajax({
    type: 'GET',
    url: '/projects/'+ projectId + '/branches/' + id
  }).done(function(result){
      currentBranch = new Branch(result.branch);
      updateBranchDisplay();
  }).fail(function(error){
      console.log(error);
  });
}
function updateBranchDisplay() {
  $('.branches_span').text("Branch:  " + currentBranch.name);
}
function setWarnings() {
  $('#new_branch_name').addClass('warning');
  $('#warning_div').addClass('warning_paragraph_visible').removeClass('warning_paragraph_hidden')
}
function resetWarnings() {
  $('#new_branch_name').val('');
  $('#new_branch_name').removeClass('warning');
  $('#warning_div').addClass('warning_paragraph_hidden').removeClass('warning_paragraph_visible');
  $('#create_branch_prompt_div').removeClass('warning_paragraph_visible').addClass('warning_paragraph_hidden');
}