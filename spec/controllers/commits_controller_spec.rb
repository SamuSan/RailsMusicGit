require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  fixtures :projects, :branches, :commits, :notes

  let(:project)     { projects(:with_title) }
  let(:branch)      { branches(:branch_master) }
  let(:parsed_body) { JSON.parse(response.body) }

  describe "POST create" do
    let(:create_commit) { instance_double(CreateCommit) }
    let(:commit_three)  { commits(:commit_three) }
    let(:notes)      {"[ {\"position\":104,\"duration\":1,\"frequency\":335.65}, null ]"}

    context "the user trys to access a non existent project" do
      it "raises an error if the project id provided is not found" do
        xhr :post, :create, project_id: 1000, branch_id: 100, notes: notes
        expect(response).to redirect_to(projects_path)
      end
    end

    context "when the commit is successfully created" do
      it "creates a commit" do
        expect {
          xhr :post, :create, project_id: project.id, current_commit_id: commit_three.id, branch_id: branch.id, notes: notes, comments: "lskdf"
        }.to change(Commit, :count).by 1
      end

      it "changes the current branch's head commit pointer to the newest commit" do
          xhr :post, :create, project_id: project.id, branch_id: branch.id, notes: notes

      end
    end

    context 'when creating a commit fails ' do
      it "redirects to the index and displays an error message" do
        expect  {
          xhr :post, :create, project_id: 100, branch_id: branch.id , notes: notes
          expect(response).to redirect_to(projects_path)
        }.not_to change(Commit, :count)
      end
    end
  end

  describe "GET show" do
    let(:commit_one)    { commits(:commit_one) }
    let(:commit_three)  { commits(:commit_three) }

    context "when notes are requested for a commit that contains notes" do
      it "returns the notes in json format" do
        xhr :get, :show, project_id: project.id, branch_id: branch.id, id: commit_one.id
        expect(response.status).to eq 200
        expect(parsed_body).to eq("commit" => {"id"=>249911736, "number"=>1, "parent_commit_id"=>nil, "next_commit_id"=>625169700, "notes"=>[{"id"=>178234897, "position"=>3, "duration"=>6, "frequency"=>330.0, "commit_id"=>249911736}]})
      end
    end

    context "when there are no notes" do
      it "returns an empty array" do
        xhr :get, :show, project_id: project.id, branch_id: branch.id, id: commit_three.id
        expect(response.status).to eq 200
        expect(parsed_body).to eq("commit" => {"id"=>79440187, "number"=>3, "parent_commit_id"=>625169700, "next_commit_id"=>79440187, "notes"=>[]})
      end
    end
  end
end