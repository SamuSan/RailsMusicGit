class FindNextCommitId
  def initialize(all_commits: , commit_to_search_from: )
    @all_commits = all_commits
    @commit_to_search_from = commit_to_search_from
  end

  def call
    child_commit = @all_commits.select { |commit| commit.parent_commit.id == @commit_to_search_from.id unless commit.parent_commit.nil? }
    child_commit.empty? ? @commit_to_search_from.id : child_commit.first.id
  end
end