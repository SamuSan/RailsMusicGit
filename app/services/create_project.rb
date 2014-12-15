class CreateProject
	def initialize(project_params)
		@project_params = project_params
	end

	def call
		Project.transaction do
			project = Project.new(@project_params)

	    if project.save
				commit = Commit.create!(parent_commit_id: nil, project_id: project.id)
		    Branch.create!(branch_name: Branch::MASTER_BRANCH_NAME, head_commit_id: commit.id)
	    	project
	    end
	  end
	end
end