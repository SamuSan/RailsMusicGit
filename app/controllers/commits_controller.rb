class CommitsController < ApplicationController
	def index
		
	end

	def show
		
	end

	def new
		
	end

	def create
		if request.xhr?
			notes_to_be_committed  = JSON.parse(params[:notes]).compact!
			@project = Project.find(params[:project_id])

			if params[:parent_commit_id] 
				parent_commit = Commit.find(params[:parent_commit_id])
			end

			CreateCommit.new(project: @project, commit: parent_commit, notes: notes_to_be_committed).call
			render template: "projects/_project_commit_history"
		end
	end
end
