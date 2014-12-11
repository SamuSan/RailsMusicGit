require 'rails_helper'

RSpec.describe BranchesController, :type => :controller do
  fixtures :projects, :commits

  let(:project)     { projects(:with_title)  }
  let(:commit_one)  { commits(:commit_one) }
  let(:parsed_body) { JSON.parse(response.body) }

  describe "POST create" do
    it "creates a new branch" do
      expect { 
        xhr :post, :create, project_id: project.id, branch_name: "Sausages", from_commit_id: commit_one.id
        }.to change(Branch, :count).by 1  
    end
  end

  describe "GET show" do
    it "returns the branch and its commits and notes in JSON" do
      xhr :post, :create, project_id: project.id, branch_name: "Sausages", from_commit_id: commit_one.id
      expect(parsed_body).to eq("commit" => {"id"=>249911736})
    end
  end
end
