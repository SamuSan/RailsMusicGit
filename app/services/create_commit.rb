class CreateCommit
	def initialize(project: project, commit: nil, notes: nil) 
		@project  = project
		@commit = commit
		@notes = notes.to_a
	end

	def call
		commit = @project.commits.build(parent_commit: @commit, commit_number: (@commit.commit_number +  1))
		@notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }	
		commit.save!
	end
end