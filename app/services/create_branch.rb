class CreateBranch
  def initialize(from_commit:, branch_name:)
    @branch_name = branch_name
    @from_commit = from_commit
  end

  def call
    Branch.transaction do
      branch = Branch.create(branch_name: @branch_name, head_commit: @from_commit)
    end
  end
end