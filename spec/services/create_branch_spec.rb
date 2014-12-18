require 'rails_helper'

RSpec.describe CreateBranch do
  fixtures :commits, :branches, :notes

  let(:commit)        { commits(:commit_one) }
  let(:branch)        { branches(:branch_master) }
  let(:branch_params) { {name: "Sausage", from_commit_id: commit.id, current_branch_id: branch.id, notes: []} }
  let(:note)          { notes(:note_one) }
  let(:notes_array)   { [note]  }

  context "when making a new branch" do
    describe "call" do
      context "a new branch is created" do
        it "creates a new branch" do
          expect {
            CreateBranch.new(branch_params: branch_params).call
          }.to change(Branch, :count).by 1
        end

        it "the new branch points at a the commit it was branched from" do
          new_branch = CreateBranch.new(branch_params: branch_params).call
          expect(new_branch.head_commit.id).not_to be_nil
        end

        it "points the head_commit to the passed commit as a parent" do
          new_branch = CreateBranch.new(branch_params: branch_params).call
          expect(new_branch.head_commit.id).to eq commit.id
        end
      end
    end
  end
end
