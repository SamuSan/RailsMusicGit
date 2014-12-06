class CreateCommit
	def initialize(project: project, commit: nil, notes: nil) 
		@project  = project
		@commit = commit
		@notes = notes
	end

	def call
		commit = @project.commits.build(parent_commit: @commit)
		if !@notes.nil?
			@notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }	
		end
		commit.save!
	end
end