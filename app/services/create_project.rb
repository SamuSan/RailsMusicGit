class CreateProject
	def initialize(project_params)
		@project_params = project_params
	end

	def call
		project = Project.create(@project_params)
    project.commits.create
    project
	end
end