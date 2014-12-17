class FindCommitNumber
  def initialize(commit:, branch_id: )
    @commit = commit
    @branch_id = Branch.find(branch_id)
    @commits_list = []
  end

  def call
    branch = Branch.find(@branch_id)
    @commits_list = CollectCommits.new(Commit.find(branch.head_commit_id)).call 
    @commits_list.reverse!
    # require 'pry-byebug'; binding.pry
    @commits_list.index(@commit)
  end
end