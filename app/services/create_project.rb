class CreateProject
	def initialize(project_params)
		@project_params = project_params
	end

	def call
		Project.transaction do
			project = Project.new(@project_params)

	    if project.save
				commit = project.commits.create!(number: 1)
		    Branch.create!(name: Branch::MASTER_BRANCH_NAME, head_commit: commit)
	    	project
	    end
	  end
	end
end