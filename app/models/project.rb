class Project < ActiveRecord::Base
	TEMPO_RANGE = 60..180

	has_many :commits, dependent: :destroy
  
  validates :title, presence: true
  validates :tempo, inclusion: { in: TEMPO_RANGE }
end
