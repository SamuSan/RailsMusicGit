class CommitsController < ApplicationController
	def index
		
	end

	def show
		if request.xhr?	
			notes_for_commit = []
			notes_for_commit = Commit.where(project_id: params[:project_id], commit_number: params[:commit_number]).first.notes
			
			render json: notes_for_commit
		end
	end

	def new
		
	end

	def create
		if request.xhr?
			notes_to_be_committed  = JSON.parse(params[:notes]).compact!
			@project = Project.find(params[:project_id])

			parent_commit = @project.commits.last
			CreateCommit.new(project: @project, commit: parent_commit, notes: notes_to_be_committed).call
			@player = Player.new
			render 'projects/_project_management'
		end
	end
end
