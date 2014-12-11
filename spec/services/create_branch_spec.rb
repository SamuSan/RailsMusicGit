require 'rails_helper'

RSpec.describe CreateBranch do
  fixtures :commits

  let(:commit) { commits(:commit_one) }
  let(:create_branch) { CreateBranch.new(commit) }

  context "when making a new branch" do
    describe "call" do
      context "a new branch is created" do
        it "creates a new commit" do
          expect {
            CreateBranch.new(branch_name: "Sausage", from_commit: commit).call
            }.to change(Commit, :count).by 1
        end

        it "creates a new branch" do
          expect {
            CreateBranch.new(branch_name: "Sausage", from_commit: commit).call
            }.to change(Branch, :count).by 1
        end
        it "the new branch points at a new commit" do
         
        end
        it "the new commit points to the passed commit as a parent" do
         
        end
      end
    end
  end
end
