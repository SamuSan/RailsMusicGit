class Branch < ActiveRecord::Base
  MASTER_BRANCH_NAME = "master"

  belongs_to :head_commit, class_name: 'Commit'

  validates :branch_name, presence: true
  validates :head_commit_id, presence: true

  def needs_new_commit?(notes)
    (Commit.find(head_commit_id).notes - notes).size > 0
  end
end
