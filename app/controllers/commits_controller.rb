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
			@player = Player.new
			notes = ParseNotes.new(notes: params[:notes]).call

			commit = CreateCommit.new(project: @project, current_commit_id: params[:current_commit_id], notes: notes, comments: params[:comments]).call
			UpdateBranch.new(branch: @branch, commit: commit).call

			render json: commit, head_commit: @branch.head_commit
	end

	private

	def load_branch
		@branch = Branch.find(params[:branch_id])
	end

	def load_project
		@project = Project.find(params[:project_id])
	end
end
