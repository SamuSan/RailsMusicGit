class CreateCommit
	def initialize(branch_id:, notes: nil) 
		@branch = Branch.find(branch_id)
		@parent_commit = Commit.find(@branch.head_commit_id)
		@notes = notes.present? ? JSON.parse(notes).compact : notes.to_a
	end

	def call
		commit = Commit.new(project_id: @parent_commit.project_id, parent_commit: @parent_commit)
		@branch.head_commit_id = commit.id
		@notes.each { |note| commit.notes.build(position:note["position"], duration: note["duration"], frequency: note["frequency"]) }	
		commit.save!
	end
end