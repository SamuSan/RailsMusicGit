class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@player = Player.new
		@project = Project.find(params[:id])
	end

	def new
		
	end

	def create
		service = CreateProject.new(project_params)
		
		if project = service.call
			redirect_to project
		else
			redirect_to :index
		end
	end

	private

	def project_params
		params.require(:project).permit(:title, :tempo)
	end
end
