class Commit < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  belongs_to :project
  belongs_to :parent_commit, :class_name => 'Commit'

  validates :project, presence: true, uniqueness: { scope: :id }
  validates :number, presence: true 

  def next_commit_towards_head_commit(head_commit)
     all_commits = CollectCommits.new(head_commit).call
     FindNextCommitId.new(all_commits: all_commits, commit_to_search_from: self).call
  end
end
