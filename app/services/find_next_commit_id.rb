class FindNextCommitId
  def initialize(all_commits: , commit_to_search_from: )
    @all_commits = all_commits
    @commit_to_search_from = commit_to_search_from
  end

  def call
    all_commits.index_of(commit) + 1    
  end
end