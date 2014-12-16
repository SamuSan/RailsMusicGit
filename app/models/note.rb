class Note < ActiveRecord::Base
  belongs_to :commit

  def match?(other)
    position == other.position && duration == other.duration && frequency == other.frequency
  end
end
