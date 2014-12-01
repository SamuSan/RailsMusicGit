require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) { Note.new }

  it "creates a note with a default duration of 4" do
    expect(note.duration).to be 4
  end
end