class CreateBranch
  def initialize(branch_params:)
    @name        = branch_params[:name]
    @current_branch_id  = branch_params[:current_branch_id]
    @from_commit        = Commit.find(branch_params[:from_commit_id])
  end

  def call
    Branch.transaction do 
      project = Project.find(@from_commit.project.id)
      project.lock!(lock = true)
      Branch.create!(name: @name, head_commit: Commit.find(@from_commit.id))
    end
  end
end