class CreateCommit
	def initialize(project:, commit: nil, notes: nil) 
		@project  = project
		@commit = commit
		@notes = notes
	end

	def call
		commit = @project.commits.build(parent_commit: @commit)
		@notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }
		commit.save!
	end
end