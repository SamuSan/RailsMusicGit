class CreateBranch
  def initialize(from_commit:, branch_name:)
    @branch_name = branch_name
    @from_commit = from_commit
  end

  def call
    Branch.transaction do
      head_commit = Commit.create(project_id: @from_commit.project_id, parent_commit_id: @from_commit.id)
      if head_commit
        branch = Branch.create(branch_name: @branch_name, head_commit: head_commit)
      end
    end
  end
end