class Commit < ActiveRecord::Base
  has_many :notes
  belongs_to :project
  belongs_to :parent_commit, :class_name => 'Commit'
end
