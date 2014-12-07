require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  fixtures :projects, :commits

  describe "POST create" do
    let(:create_commit) { instance_double(CreateCommit) }
    let(:notes)         { ["one"].to_json }
    context "when the comit is successfully created" do
      it "renders the commit histroy template" do
        xhr :post, :create, project_id: 1, parent_commit_id: 1, notes: notes
        expect(response).to render_template("projects/_project_commit_history")
      end
    end
  end
end