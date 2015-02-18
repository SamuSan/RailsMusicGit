class Project < ActiveRecord::Base
	TEMPO_RANGE = 60..180
  #TODO defaula are unneeded
  has_many :commits, dependent: :destroy

  validates :title, presence: true
  validates :tempo, inclusion: { in: TEMPO_RANGE }
end
