class ProjectsController < ApplicationController
	def index
		@projects 		= Project.all
	end

	def show
		@player 			= Player.new
		@project 			= Project.find(params[:id])
		@last_commit 	= @project.commits.last
	end

	def new
		
	end

	def create
		service = CreateProject.new(project_params)
		
		if project = service.call
			redirect_to project
		else
			flash[:alert] = "Project creation failed"
			redirect_to projects_path
		end
	end

	private

	def project_params
		params.require(:project).permit(:title, :tempo)
	end
end
