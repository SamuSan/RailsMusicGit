require 'rails_helper'

RSpec.describe Branch, :type => :model do
  fixtures :commits

  let(:commit) { commits(:commit_one) }

  context "when making a new branch" do
    describe "initialize" do
      it "fails when no name is provided" do
        expect{ Branch.create!( head_commit: commit) }.to raise_error
      end

      it "fails when no from commit is provided is provided" do
        expect{ Branch.create!( name:"Bung") }.to raise_error
      end

      it "succeeds when both arguments are passed" do
        expect{ Branch.create!(head_commit: commit,  name:"Bung") }.not_to raise_error
      end
    end
  end
end
