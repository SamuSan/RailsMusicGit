class Commit < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  belongs_to :project
  belongs_to :parent_commit, :class_name => 'Commit'

  validates :project, presence: true
  validates :number, presence: true
  #TODO this in the wrong place
  #TODO what does this name mean? Next from what? FInd the commit not the ID
  #Traverse branch? Something more meaningful
  #Service inherently action based, side effect by definition
  def next_commit_towards_head_commit(head_commit)
    all_commits = CollectCommits.new(head_commit).call
    FindNextCommitId.new(all_commits: all_commits, commit_to_search_from: self).call
  end
end
