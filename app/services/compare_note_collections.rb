class CompareNoteCollections
  def initialize(current_notes, new_notes)
    @current_notes      = current_notes
    @new_notes   = new_notes
  end

  def call
    @current_notes.size == @new_notes.size && notes_match?
  end

  private

  def notes_match?
    @current_notes.zip(new_notes).all? { |a, b| a.match?(b) }
  end
end