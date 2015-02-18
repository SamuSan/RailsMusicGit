class CreateCommit #TODO this guy should be dealing with creating and dealing with updating a branch
	def initialize(project:, current_commit_id:, notes_params: [], comments:)#TODO oh shit this broke all of the things

		#TODO kill prject and curr**************************************************************************************** for branch
		@project 						= project
		@current_commit_id 	= current_commit_id
		@comments  					= comments
		@notes_params 			= notes_params
	end

	def call
		@project.with_lock do
			if CompareNoteCollections.new(parent_commit.notes, new_notes).call
				create_commit
			else
				parent_commit
			end
		end
	end

	private

  def new_notes
    @new_notes_params.map { |note_params| Note.new(note_params) }#TODO this fucked everything
  end

	def parent_commit
		Commit.find(@current_commit_id) #TODO branch head memoizing
	end

	def create_commit
		commit = @project.commits.build(
			project: 				@project,
			parent_commit: 	parent_commit,
			comments: 			@comments,
			number: 				next_commit_number
		)

		@notes_params.each { |note_params| commit.notes.build(note_params) } #TODO lnk to the commit insead of building

		commit.save!
		commit
	end

	def next_commit_number
		@project.commits.maximum(:number) + 1
	end
end