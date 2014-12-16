class FindCommitNumber
  def initialize(commit:, branch_id: )
    @commit = commit
    @branch_id = Branch.find(branch_id)
    @commits_list = []
  end

  def call
    branch = Branch.find(@branch_id)
    collect_commits(Commit.find(branch.head_commit_id)) 
    @commits_list.reverse!
    @commits_list.index(@commit)
  end

  private

  def collect_commits(commit)
    @commits_list << commit
    current_commit = Commit.find(commit.parent_commit_id)
    unless current_commit.parent_commit_id.nil?
      collect_commits(current_commit) 
    else
      @commits_list << current_commit
    end
  end
end