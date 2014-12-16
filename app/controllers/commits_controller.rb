class CommitsController < ApplicationController
	require 'commits_helper'
	
	def index
	end

	def show
		if params[:index].present?
			commit = FindCommitByIndex.new(params[:index], params[:branch_id]).call
			commit_index = params[:index]
		else
			commit = Commit.where(project_id: params[:project_id], id: params[:id]).first!
			commit_index = FindCommitNumber.new(branch_id: params[:branch_id], commit: commit).call
		end
		commit_return =  {"commit_index" => commit_index, "commit" => commit}
		render json: commit_return
	end

	def new
	end

	def create
		begin
			commit = CreateCommit.new(branch_id: params[:branch_id], notes: params[:notes], comments: params[:comments]).call
			@player = Player.new
			commit_return = {
				"commit_number" => FindCommitNumber.new(branch_id: params[:branch_id], commit: commit).call,
				"commit" => commit
			}
			render json: commit_return
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with ID #{params[:project_id]} not found"
			redirect_to projects_path
		end
	end
end
