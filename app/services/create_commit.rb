class CreateCommit
	def initialize(branch_id:, notes: nil, comments:) 
		@branch 				= Branch.find(branch_id)
		@comments  			= comments
		@parent_commit 	= Commit.find(@branch.head_commit_id)
		@notes 					= notes.present? ? JSON.parse(notes).compact : notes.to_a
	end

	def call
		Commit.transaction do
			commit = Commit.new(project_id: @parent_commit.project_id, parent_commit: @parent_commit, comments: @comments)
			@notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }	
			commit.save!
			@branch.head_commit_id = commit.id
			@branch.save!
			commit
		end
	end
end