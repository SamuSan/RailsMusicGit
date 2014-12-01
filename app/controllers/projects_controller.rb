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
		project = Project.create!(project_params)
		redirect_to project
	end

	private

	def project_params
		params.require(:project).permit(:title, :tempo)
	end
end
