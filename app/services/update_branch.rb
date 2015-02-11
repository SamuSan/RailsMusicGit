class UpdateBranch
  def initialize(branch:, commit:)
    @branch = branch
    @commit = commit
  end

  def call
    @branch.reload
    @branch.lock!(lock = true)
    @branch.head_commit = @commit
    @branch.save!
  end
end