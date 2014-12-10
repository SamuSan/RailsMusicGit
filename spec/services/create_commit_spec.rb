RSpec.describe CreateCommit do
  describe "initialize" do
    fixtures :projects

    let(:create_commit) { instance_double(CreateCommit) }
    let(:project)       { projects(:with_title) }

    context "the user trys to access a non existent project" do
      it "raises an error if the project id provided is not found" do
        expect { CreateCommit.new(project_id:1000, notes:[]) }.to raise_error("Couldn't find Project with 'id'=1000")
      end
    end

    context "the user trys to access an existing project" do
      it "does not raise an error" do
        expect { CreateCommit.new(project_id: project.id, notes:[]) }.to_not raise_error
      end
    end

    context "a commit is saved to the db" do
      it "increases the commit count by one" do
        expect {
          CreateCommit.new(project_id: project.id, notes:[]).call
        }.to change(Commit, :count).by 1
      end
    end
  end
end