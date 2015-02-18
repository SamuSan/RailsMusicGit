require 'rails_helper'

RSpec.describe CompareNoteCollections do
  fixtures :commits, :branches, :notes


  let(:notes)         {"[ {\"position\":104,\"duration\":1,\"frequency\":335.65}, null ]"}
  let(:notes_other)   {"[ {\"position\":104,\"duration\":1,\"frequency\":335.65}, null ]"}
  let(:notes_other_different)   {"[ {\"position\":114,\"duration\":1,\"frequency\":335.65}, null ]"}

  describe "call" do
    it "returns tru when the tow sets of notes are the same" do
      comparision = CompareNoteCollections.new(ParseNotes.new(notes: notes).call, ParseNotes.new(notes: notes_other).call).call
      expect(comparison).to be true
    end

    it "returns false when the two sets of notes are different" do
      expect {
        CompareNoteCollections.new(notes, notes_other_different).call
      }.to be false
    end
  end

end
