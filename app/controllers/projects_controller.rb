class ProjectsController < ApplicationController
	def index
		@projects 		= Project.all
	end

	def show
		@player = Player.new
		begin
			@project = Project.find(params[:id])
			@commits = Commit.all.where(project_id: @project.id)
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with id #{params[:id]} not found!"
			redirect_to projects_path
		end
	end

	def new;end

	def create
		project = CreateProject.new(project_params).call
		
		if project
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
