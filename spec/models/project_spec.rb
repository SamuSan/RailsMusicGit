require 'rails_helper'

RSpec.describe Project, type: :model do
  fixtures :projects
  describe "#new" do
    context "when the title is supplied" do
      it "creates a project with the supplied title" do
        expect(projects(:with_title).title).to eq "ManBoogey"  
      end
    end

    context "when the title is not supplied" do
      it "creates a project with the default title" do
        expect(Project.create!.title).to eq "Untitled"  
      end
    end

    context "when the tempo is supplied" do
      it "creates a project with thesupplied tempo" do
        expect(Project.create!(tempo: 140).tempo).to be 140  
      end
    end

    context "when the tempo is not supplied" do
      it "creates a project with the default tempo" do
        expect(Project.create!.tempo).to be 120 
      end
    end
  end
end
