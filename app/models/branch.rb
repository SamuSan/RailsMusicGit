class Branch < ActiveRecord::Base
  MASTER_BRANCH_NAME = "master"

  belongs_to :head_commit, class_name: 'Commit'

  validates :name, presence: true
  validates :head_commit, presence: true
  #TODO validate name uniqueness against porject
end
