class Commit < ActiveRecord::Base
  has_many :notes

  belongs_to :parent, :class_name => 'Commit', :foreign_key => :parent_id
  has_many :children, :class_name => 'Commit'
end
