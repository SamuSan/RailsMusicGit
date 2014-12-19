class CompareNoteCollections
  def initialize(current_notes, new_notes)
    @current_notes  = current_notes
    @new_notes      = new_notes
  end

  def call
    require 'pry-byebug'; binding.pry
    build_array_of_notes(@new_notes)
    @current_notes.size != @new_notes.size || !compare_notes
  end

  private

  def build_array_of_notes(notes)
    @new_notes = @new_notes.map { |note| Note.new(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }    
  end

  def compare_notes
    @current_notes.zip(@new_notes).map { |a,b| a.match?(b) }.all? {|result| result }
  end
end