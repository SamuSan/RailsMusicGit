class CreateProject
	def initialize(project_params)
		@project_params = project_params
	end

	def call
		Project.transaction do
			project = Project.new(@project_params)
			commit = Commit.create!(parent_commit_id: nil, project_id: project.id)
	    if project.save
		    project.branches.create!(branch_name: "master", head_commit_id: commit.id)
	    	project
	    end
	  end
	end
end