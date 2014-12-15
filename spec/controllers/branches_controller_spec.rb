require 'rails_helper'

RSpec.describe BranchesController, :type => :controller do
  fixtures :projects, :branches, :commits

  let(:project)     { projects(:with_title)  }
  let(:branch)      { branches(:branch_master) }
  let(:commit_one)  { commits(:commit_one) }


  describe "POST create" do
    it "creates a new branch" do
      expect { 
        xhr :post, :create, project_id: project.id, branch_name: "Sausages", from_commit_id: commit_one.id
        }.to change(Branch, :count).by 1  
    end
  end

  describe "GET show" do
    let(:parsed_body) { JSON.parse(response.body) }

    it "returns the branch and its commits and notes in JSON" do
      xhr :get, :show, project_id: project.id, id: branch.branch_name
      expect(parsed_body).to eq("branch" => {"id"=> branch.id, "branch_name"=>branch.branch_name, "head_commit_id"=>branch.head_commit_id})
    end
  end
end
