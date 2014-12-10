class Commit < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  belongs_to :parent_commit, :class_name => 'Commit'
end
