class Branch < ActiveRecord::Base
  belongs_to :head_commit, class_name: 'Commit'

  validates :branch_name, presence: true
  validates :head_commit_id, presence: true

  def move_forward_one_commit(id_for_current_commit)

  end
end
