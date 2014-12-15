// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  projectId = $("meta[property=projectId]").attr("content");
  currentCommitId = $("meta[property=currentCommitId]").attr("content");
  currentBranchId = $("meta[property=currentBranchId]").attr("content");

  $('.add_branch_button').on('click', function(){
    $.ajax({
      type: 'POST',
      url: '/projects/'+ projectId + '/branches',
      data: { "currentBranchId" : currentBranchId,
             "notes" : JSON.stringify(Notes.notesInPlayer())  }
    }).done(function(result){
      $("#project_management_div").html(result);
      updateCommitsLabel();
    }).fail(function(error){
      console.log(error);
    }); 
  });
})