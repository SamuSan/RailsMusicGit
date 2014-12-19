class Commit < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  belongs_to :project
  belongs_to :parent_commit, :class_name => 'Commit'

  validates :project, presence: true, uniqueness: { scope: :id }
  validates :number, presence: true 
end
