class CreateProject
	def initialize(project_params)
		@project_params = project_params
	end

	def call
		Project.transaction do
			project = Project.new(@project_params)
	    if project.save
		    project.commits.create!(commit_number: 1, notes: [])
	    	project
	    end
	  end
	end
end