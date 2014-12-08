require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  fixtures :projects, :commits, :notes

  describe "POST create" do
    let(:create_commit) { instance_double(CreateCommit) }
    let(:notes)         { ["one"].to_json }
    
    context "when the commit is successfully created" do
      it "renders the commit histroy template" do
        xhr :post, :create, project_id: 1, parent_commit_id: 1, notes: notes
        expect(response).to render_template("projects/_project_management")
      end
    end

    pending "To be filled out"
    context 'when savig a commit fails ' do
      it "redirects to the current project and displays an error message"
    end

    pending "To be filled out"
    context "when notes are requested for a commit that contains notes" do
      let(:project)     { projects(:with_title) }
      let(:commit_one)  { commits(:commit_one)}
      let(:notes)       { double }
      
      before do 
        # expect(commit_one).to receive(:notes).and_return notes
      end 

      it "returns the notes in json format" do
        xhr :get, :show, project_id:1, id:1, commit_number: 1
        expect(response.status).to eq 200
      end      
    end

    pending "To be filled out"
    context "when notes are requested for a commit that doesn't contain notes" do
      let(:project)     { projects(:with_title) }
      let(:commit_one)  { commits(:commit_one)}
      let(:notes)       { double }
      
      before do 
        # expect(commit_one).to receive(:notes).and_return notes
      end 

      it "returns an empty array with a success status" do
        xhr :get, :show, project_id:1, id:1, commit_number: 1
        expect(response.status).to eq 200
      end      
    end  

    pending "To be filled out"
    context 'when a commit is saved' do
      it 'saves the notes sent from the browser' do
           
      end   
    end 
  end
end