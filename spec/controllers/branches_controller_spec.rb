require 'rails_helper'

RSpec.describe BranchesController, :type => :controller do
  fixtures :projects, :branches, :commits, :notes

  let(:project)     { projects(:with_title)  }
  let(:branch)      { branches(:branch_master) }
  let(:commit_one)  { commits(:commit_one) }

  describe "POST create" do
    it "creates a new branch" do
      expect { 
        xhr :post, :create, project_id: project.id, branch: {"name" => "Spanglebot", "current_branch_id" => branch.id, "from_commit_id" => branch.head_commit.id}  
        }.to change(Branch, :count).by 1  
    end
  end

  describe "GET show" do
    let(:parsed_body) { JSON.parse(response.body) }

    it "returns the branch and its commits and notes in JSON" do
      xhr :get, :show, project_id: project.id, id: branch.id
      expect(parsed_body).to eq("branch" => {"id"=>409523846, "name"=>"master", "head_commit"=>{"id"=>79440187, "number"=>3, "parent_commit_id"=>625169700, "notes" =>[]}})
    end
  end
end
