require 'rails_helper'

RSpec.describe BranchesController, :type => :controller do
  fixtures :projects, :branches, :commits, :notes

  let(:project)     { projects(:with_title)  }
  let(:branch)      { branches(:branch_master) }
  let(:commit_one)  { commits(:commit_one) }
  let (:notes)      {"[ {\"position\":104,\"duration\":1,\"frequency\":335.65},null, {\"position\":106,\"duration\":1,\"frequency\":335.65}, {\"position\":118,\"duration\":1,\"frequency\":335.65},null, {\"position\":134,\"duration\":2,\"frequency\":335.65},{\"position\":148,\"duration\":1,\"frequency\":335.65},{\"position\":151,\"duration\":1,\"frequency\":335.65}]"}

  describe "POST create" do
    before do
      # let(:params) { {"branch" : } }
    end
    it "creates a new branch" do
      expect {
        xhr :post, :create, project_id: project.id, branch: {"name" => "Spanglebot", "current_commit_id" => commit_one.id, "notes" => notes, "comments" => "sadkjffh"}
        }.to change(Branch, :count).by 1
    end
  end

  describe "GET show" do
    let(:parsed_body) { JSON.parse(response.body) }

    it "returns the branch" do
      xhr :get, :show, project_id: project.id, id: branch.id
      expect(parsed_body).to eq("branch" => {"id"=>409523846, "name"=>"master", "head_commit_id" => 79440187})
    end
  end
end
