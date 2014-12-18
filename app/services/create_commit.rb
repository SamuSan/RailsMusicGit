class CreateCommit
	def initialize(project:, branch:, notes: [], comments:) 
		@project 				= project
		@branch 				= branch
		@comments  			= comments
		@notes 					= notes
	end

	def call

		Commit.transaction do
			@project.lock!(lock = true)
			@branch.reload
			@parent_commit 	= Commit.find(@branch.head_commit_id)

			commit = @project.commits.create(project: @project, parent_commit: @parent_commit, comments: @comments, number: FindCommitNumber.new(project: @project).call)
			# @notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }	
			commit.save!
			
			@branch.head_commit = commit
			@branch.save!
			commit
		end
	end
end