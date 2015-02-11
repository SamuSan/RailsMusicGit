class CreateCommit
	def initialize(project:, current_commit_id:,  branch:, notes: [], comments:)
		@project 						= project
		@current_commit_id 	= current_commit_id
		@branch 						= branch
		@comments  					= comments
		@notes 							= notes
	end

	def call

		Commit.transaction do
			@project.lock!(lock = true)
			@branch.reload
			@parent_commit 	= Commit.find(@current_commit_id) #TODO no this is just plain wrong

			if CompareNoteCollections.new(@parent_commit.notes, @notes).call
				commit = @project.commits.create(project: @project, parent_commit: @parent_commit, comments: @comments, number: FindCommitNumber.new(project: @project).call)
				@notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }
				commit.save!

				@branch.head_commit = commit
				@branch.save!
				commit
			else
				@parent_commit
			end
		end
	end
end