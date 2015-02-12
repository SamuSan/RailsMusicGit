require 'rails_helper'

RSpec.describe CreateBranch do
  fixtures :commits, :branches, :notes

  let(:commit)        { commits(:commit_one) }
  let(:branch)        { branches(:branch_master) }
  let(:notes)         {"[ {\"position\":104,\"duration\":1,\"frequency\":335.65}, null ]"}
  let(:branch_params) { {name: "Sausage", current_commit_id: commit.id, notes: notes, comments: ""} }

  context "when making a new branch" do
    describe "call" do
      context "a new branch is created" do
        it "creates a new branch" do
          expect {
            CreateBranch.new(branch_params: branch_params).call
          }.to change(Branch, :count).by 1
        end
      end

      context "a new branch is created from a commit with changed notes" do
        it "creates the branch with the head commit pointing at a new commit" do
          expect {
            new_branch = CreateBranch.new(branch_params: branch_params).call
          }.to change(Commit, :count).by 1
        end
      end

      context "a new branch is created form  a commit with no changed notes" do
        let(:notes_no_change) {"[ {\"position\":3,\"duration\":6,\"frequency\":330.0}, null ]"}
        let(:branch_params_no_change) { {name: "Sausage", current_commit_id: commit.id, notes: notes_no_change, comments: ""} }

        it "creates a branch pointing at the current commit" do
          expect {
            new_branch = CreateBranch.new(branch_params: branch_params_no_change).call
          }.to change(Commit, :count).by 0
        end
      end
    end
  end
end
