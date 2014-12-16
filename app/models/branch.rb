class Branch < ActiveRecord::Base
  MASTER_BRANCH_NAME = "master"

  belongs_to :head_commit, class_name: 'Commit'

  validates :branch_name, presence: true
  validates :head_commit_id, presence: true
end
