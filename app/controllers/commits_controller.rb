class CommitsController < ApplicationController
	def index
		
	end

	def show
		
	end

	def new
		
	end

	def create
		project = Project.find(params[:project_id])

		if params[:parent_commit_id] 
			parent_commit = Commit.find(params[:parent_commit_id])
		end

		commit = CreateCommit.new(project: project, commit: parent_commit).call
		
		if commit
			redirect_to project
		else
			flash[:alert] = "Commit creation failed"
		end
	end
end
