class CreateBranch
  def initialize(branch_params:)
    @name           = branch_params[:name]
    @from_commit    = Commit.find(branch_params[:current_commit_id])
  end

  def call
    Branch.transaction do
      head_commit = CreateCommit.new().call

      Branch.create!(name: @name, head_commit: Commit.find(@from_commit.id))
    end
  end
end