class CommitsController < ApplicationController
	def index;end

	def show
		notes_for_commit = Commit.where(project_id: params[:project_id], commit_number: params[:id]).first!.notes
		render json: notes_for_commit
	end

	def new
	end

	def create
		begin
			CreateCommit.new(project_id: params[:project_id], branch_name: params[:branch_name], notes: params[:notes]).call
			project = Project.find(params[:project_id])
			@player = Player.new
			render partial: 'projects/project_management'
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with ID #{params[:project_id]} not found"
			redirect_to projects_path
		end
	end
end
