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
          new_branch = CreateBranch.new(branch_name: "Sausage", from_commit: commit).call
          expect(new_branch.head_commit.id).not_to be_nil
        end

        it "points the head_commit to the passed commit as a parent" do
          new_branch = CreateBranch.new(branch_name: "Sausage", from_commit: commit).call
          expect(new_branch.head_commit.parent_commit_id).to eq commit.id
        end
      end
    end
  end
end
