class Note < ActiveRecord::Base
  belongs_to :commit
#TODO commit id validatona dn requirement
#TODO valdations on other not null attributes
#TODO sanity validations on duration / frequency ranges etc negative bad, two legs good
  def match?(other)
    position == other.position &&
      duration == other.duration &&
      frequency == other.frequency
  end
end
