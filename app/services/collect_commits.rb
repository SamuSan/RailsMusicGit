class CollectCommits
  def initialize(commit)
    @commit = commit
    @commits_list = [] 
  end

  def call
    collect_commits(@commit)
    @commits_list
  end

  private

  def collect_commits(commit)
    @commits_list << commit
    commit.parent_commit_id.nil? ? current_commit = commit  : current_commit = Commit.find(commit.parent_commit_id)
    
    unless current_commit.parent_commit_id.nil?
      collect_commits(current_commit) 
    else
      @commits_list << current_commit
    end
  end
end