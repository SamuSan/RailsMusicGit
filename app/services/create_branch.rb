class CreateBranch
  def initialize(from_commit:, branch_name:)
    @branch_name = branch_name
    @from_commit = from_commit
  end

  def call
    head_commit = Commit.create(project_id: @from_commit.project_id)
    Branch.create!(branch_name: @branch_name, head_commit: head_commit)    
  end
end