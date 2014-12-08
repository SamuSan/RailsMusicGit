require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  fixtures :projects, :commits, :notes

  describe "POST create" do
    let(:create_commit) { instance_double(CreateCommit) }
    let(:notes)         { ["one"].to_json }
    
    context "when the comit is successfully created" do
      it "renders the commit histroy template" do
        xhr :post, :create, project_id: 1, parent_commit_id: 1, notes: notes
        expect(response).to render_template("projects/_project_management")
      end
    end

    context 'when ' do
      
    end


    context "when there are notes for a commit" do
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
  end
end