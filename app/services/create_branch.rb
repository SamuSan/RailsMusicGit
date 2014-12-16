class CreateBranch
  def initialize(branch_params)
    @branch_name        = branch_params[:branch_name]
    @current_branch_id  = branch_params[:current_branch_id]
    @from_commit_id     = branch_params[:from_commit_id]
    @notes              = JSON.parse(branch_params[:notes]).compact
  end

  def call
    Branch.transaction do 
      current_branch = Branch.find(@current_branch_id)
      project_id = Commit.find(@from_commit_id).project_id
      

      if CompareNoteCollections.new(Commit.find(current_branch.head_commit_id).notes, create_notes_from_array(@notes)).call
        commit = Commit.new(project_id: project_id, parent_commit: @from_commit, comments: "")
        @notes.each { |note| commit.notes.build(position: note["position"], duration: note["duration"], frequency: note["frequency"]) }  
        commit.save!
        Branch.create!(branch_name: @branch_name, head_commit: commit)
      else
        Branch.create!(branch_name: @branch_name, head_commit: Commit.find(@from_commit_id))
      end
    end
  end

  private

  def create_notes_from_array(notes)
    notes_array = @notes.map { |note| Note.new(position: note["position"], duration: note["duration"], frequency: note["frequency"]) }
  end
end