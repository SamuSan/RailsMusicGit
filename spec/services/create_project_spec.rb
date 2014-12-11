require 'rails_helper'

RSpec.describe CreateProject do
  describe "call" do
    context "a new project is created" do 
      it "makes a new project" do
        params = { title: "bang", tempo: 160 }
        expect {
            CreateProject.new(params).call
            }.to change(Project, :count).by 1
      end
    end
  end
end