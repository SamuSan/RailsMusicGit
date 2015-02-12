require 'rails_helper'

RSpec.describe CreateCommit do
  describe "call" do
    fixtures :projects, :branches, :commits

    let(:commit)        { commits(:commit_one)  }
    let(:project)       { projects(:with_title) }
    let(:branch)        { branches(:branch_master) }
    let(:notes)         {"[ {\"position\":104,\"duration\":4,\"frequency\":335.0}, null ]"}

    context "the user trys to access an existing project" do
      it "does not raise an error" do
        expect {
          CreateCommit.new(project: project, current_commit_id: commit.id, comments: "",  notes: ParseNotes.new(notes: notes).call).call
          }.to_not raise_error
      end
    end

    context "a commit with new notes is saved" do
      it "creates a new commit" do
        expect {
          CreateCommit.new(project: project, current_commit_id: commit.id, comments: "", notes: ParseNotes.new(notes: notes).call).call
        }.to change(Commit, :count).by 1
      end
    end

    context "a commit with no new notes is saved" do
      let(:notes_no_change) {"[ {\"position\":3,\"duration\":6,\"frequency\":330.0}, null ]"}

      it "doesn't create a new commit" do
        expect {
          CreateCommit.new(project: project, current_commit_id: commit.id, comments: "", notes: ParseNotes.new(notes: notes_no_change).call).call
        }.to change(Commit, :count).by 0
      end
    end
  end
end