require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  fixtures :projects, :commits, :notes

  let(:project)     { projects(:with_title) }

  describe "POST create" do
    let(:create_commit) { instance_double(CreateCommit) }
    let(:note)          { Note.new(position: 16)}
    let(:notes)         { [note].to_json }

    context "when the commit is successfully created" do
      it "renders the project management template" do
        expect {
          xhr :post, :create, project_id: project.id, notes: notes
          expect(response).to render_template("projects/_project_management")
        }.to change(Commit, :count).by 1
      end
    end

    context 'when creating a commit fails ' do
      it "redirects to the index and displays an error message" do
        expect  {
          xhr :post, :create, project_id: 1000, notes: []
          expect(response).to redirect_to(projects_path) 
        }.not_to change(Commit, :count)
      end
    end
  end

  describe "GET show" do
    let(:commit_one)  { commits(:commit_one) }
    let(:parsed_body) { JSON.parse(response.body) }

    context "when notes are requested for a commit that contains notes" do
      it "returns the notes in json format" do
        xhr :get, :show, project_id: project.id, id: commit_one.commit_number
        expect(response.status).to eq 200
        expect(parsed_body).to eq("commits" => [{"id"=>commit_one.notes.first.id, "position"=>3, "duration"=>6, "frequency"=>330.0}])
      end      
    end
  end
end