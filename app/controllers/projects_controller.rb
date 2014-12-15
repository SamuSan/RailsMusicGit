class ProjectsController < ApplicationController
	def index
		@projects 	= Project.all
	end

	def show
		@player = Player.new
		begin
			@project = Project.find(params[:id])
			@project_branchs = Branch.where(@project.commits.pluck(:id).include?(:head_commit_id))
			@current_branch = @project_branchs.select{ |branch| branch.branch_name == Branch::MASTER_BRANCH_NAME }.first	
			@current_commit_id = @current_branch.head_commit_id
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with id #{params[:id]} not found!"
			redirect_to projects_path
		end
	end

	def new
	end

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
