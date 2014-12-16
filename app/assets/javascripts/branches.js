// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  currentCommitId = $("meta[property=currentCommitId]").attr("content");
  currentBranchId = $("meta[property=currentBranchId]").attr("content");

  getCurrentBranchName();

  $('.add_branch_button').on('click', function() {
    if($('#new_branch_name').val()) {
      $.ajax({
        type: 'POST',
        url: '/projects/'+ projectId + '/branches',
        data: { "branch" : { "current_branch_id" : currentBranchId,
                              "branch_name" : $('#new_branch_name').val(),
                              "from_commit_id" : currentCommitId,
                              "notes" : JSON.stringify(Notes.notesInPlayer())  }
              }
      }).done(function(result){
        console.log(result)
        currentBranchId = result.branch.id
        $('#new_branch_name').val('');
        updateBranchDisplay(result.branch.branch_name);
      }).fail(function(error){
        console.log(error);
      });
    }
    else{
      $('#new_branch_name').addClass('warning');
      $('#warning_div').addClass('warning_paragraph_visible').removeClass('warning_paragraph_hidden')
    };
  });

  $('#new_branch_name').on('click', function(){
    $('#new_branch_name').removeClass('warning');
  });
});

function getCurrentBranchName() {
  $.ajax({
    type: 'GET',
    url: '/projects/'+ projectId + '/branches/' + currentBranchId
  }).done(function(result){
      updateBranchDisplay(result.branch.branch_name);
  }).fail(function(error){
      console.log(error);
  });
}
function updateBranchDisplay(branch_name) {
  $('.branches_span').text("Branch:  " + branch_name);
}