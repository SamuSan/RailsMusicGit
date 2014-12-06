class CreateProject
	def initialize(project_params)
		@project_params = project_params
	end

	def call
		Project.transaction do
			project = Project.new(@project_params)
	    if project.save
		    project.commits.create!
	    	project
	    end
	  end
	end
end