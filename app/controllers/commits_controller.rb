class CommitsController < ApplicationController
	require 'commits_helper'
	
	def index
	end

	def show
		commit = Commit.where(project: Project.find(params[:project_id]), id: params[:id]).first!
		render json: commit
	end

	def new
	end

	def create
		begin
			@player = Player.new
			notes = JSON.parse(params[:notes]).compact

			commit = CreateCommit.new(project: Project.find(params[:project_id]), branch: Branch.find(params[:branch_id]), notes: notes, comments: params[:comments]).call
			render json: commit
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Project with ID #{params[:project_id]} not found"
			redirect_to projects_path
		end
	end
end
