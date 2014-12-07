require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  fixtures :notes, :commits

  describe "GET index" do

    context "when there are notes for this commit" do
      let(:commit_one)  { commits(:commit_one)}
      let(:note)        { notes(:note_one) }
      
      before do 
        expect(commit_one).to receive(:notes).and_return note
      end 

      it "returns the notes in json format" do
        xhr :get, :index, commit_id: 1
        expect(response).to be "Nah mang"
      end      
    end    
  end  
end