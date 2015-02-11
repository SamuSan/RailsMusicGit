class ParseNotes
  def initialize(notes:)
    @notes = notes
  end

  def call
    JSON.parse(@notes).compact
  end
end