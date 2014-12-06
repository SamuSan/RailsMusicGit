require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  fixtures :projects

  describe "POST create" do
    let(:create_commit) { instance_double(CreateCommit) }
    let(:notes)         { double }
    context "when the comit is successfully created" do
      it "renders the commit histroy template" do
        post :create, :commit => {:project_id => 1, :notes => notes}
        expect(response).to render_template("projects/_project_commit_history")
      end
    end
  end
end