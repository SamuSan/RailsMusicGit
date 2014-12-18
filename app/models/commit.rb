class Commit < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  belongs_to :project
  belongs_to :parent_commit, :class_name => 'Commit'
    #UNiqueness - scope project ID :MAXIMUM(:commit_number) <- commit_numb
  validates :project, presence: true # may have broken a stuff
  validates :number, presence: true #removed 'commit' this is going to break everything
end
