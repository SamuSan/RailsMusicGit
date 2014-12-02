class CreateCommit
	def initialize(project:, commit: nil) 
		@project  = project
		@commit = commit
	end

	def call
		@project.commits.create!(parent_commit: @commit)
	end
end