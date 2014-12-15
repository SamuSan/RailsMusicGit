class CommitsController < ApplicationController
	def index
	end

	def show
		commit = Commit.where(project_id: params[:project_id], id: params[:id]).first!
		render json: commit
	end

	def new
	end

	def create
		begin
			CreateCommit.new(branch_id: params[:branch_id], notes: params[:notes], comments: params[:comments]).call
			@player = Player.new
			render partial: 'projects/project_management'
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with ID #{params[:project_id]} not found"
			redirect_to projects_path
		end
	end
end
