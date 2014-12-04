class Project < ActiveRecord::Base
	TEMPO_RANGE = 60..180

	has_many :commits
  
  validates :tempo, inclusion: { in: TEMPO_RANGE }
end
