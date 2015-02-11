class CreateBranch
  def initialize(branch_params:)
    @name           = branch_params[:name]
    @from_commit_id = branch_params[:current_commit_id]
    @comments       = branch_params[:comments]
    puts branch_params[:notes]
    @notes          = ParseNotes.new(notes: branch_params[:notes]).call
  end

  def call
    Branch.transaction do
      head_commit = CreateCommit.new(project: Commit.find(@from_commit_id).project, current_commit_id: @from_commit_id, notes: @notes, comments: @comments).call

      Branch.create!(name: @name, head_commit: head_commit)
    end
  end
end