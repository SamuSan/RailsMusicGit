class CommitsController < ApplicationController
	before_action :load_branch
	before_action :load_project

	def index
	end

	def show
		commit = @project.commits.find(params[:id])
		render json: commit, head_commit: @branch.head_commit
	end

	def new
	end

	def create
		begin
			@player = Player.new
			notes = JSON.parse(params[:notes]).compact

			commit = CreateCommit.new(project: @project, current_commit_id: params[:current_commit_id], branch: @branch, notes: notes, comments: params[:comments]).call
			render json: commit, head_commit: @branch.head_commit
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with ID #{params[:project_id]} not found"
			redirect_to projects_path
		end
	end

	private

	def load_branch
		@branch = Branch.find(params[:branch_id])
	end

	def load_project
		@project = Project.find(params[:project_id])
	end
end
