class CompareNoteCollections
  def initialize(current_notes, new_notes)
    @current_notes  = current_notes
    @new_notes      = new_notes
  end

  def call
    if @current_notes.size != @new_notes.size
      true
    else
      !compare_notes
    end
  end

  private

  def compare_notes
    @current_notes.zip(@new_notes).map { |a,b| a.match?(b) }.all? {|result| result }
  end
end