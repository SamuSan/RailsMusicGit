class Commit < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  belongs_to :project
  belongs_to :parent_commit, :class_name => 'Commit'

  validates :project_id, null: false
  validates :commit_number, null: false
end
