class CreateCommit
	def initialize(project_id: project_id, notes: nil) 
		@project  = Project.find(project_id)
		@parent_commit = @project.commits.last;
		@notes = notes.present? ? JSON.parse(notes).compact : notes.to_a;
	end

	def call
		commit = @project.commits.build(parent_commit: @parent_commit, commit_number: (@parent_commit.commit_number +  1))
		@notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }	
		commit.save!
	end
end