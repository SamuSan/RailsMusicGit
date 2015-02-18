class UpdateBranch#TODO rename MoveBranchCommit
  def initialize(branch:, commit:)
    @branch = branch
    @commit = commit
  end

  def call
    @branch.update!(head_commit: @commit)
  end
end