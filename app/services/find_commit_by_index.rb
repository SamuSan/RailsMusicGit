class FindCommitByIndex
  def initialize(index, branch_id)
    @index  = index.to_i
    @branch = Branch.find(branch_id)
  end

  def call
    commits = CollectCommits.new(Commit.find(@branch.head_commit_id)).call
    commits.reverse!
    commit  = commits[@index]
  end
end