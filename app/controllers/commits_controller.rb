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
			CreateCommit.new(project_id: params[:project_id], notes: params[:notes]).call
			@player = Player.new
			render 'projects/_project_management'
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with ID #{params[:project_id]} not found"
			redirect_to projects_path
		end
	end
end
