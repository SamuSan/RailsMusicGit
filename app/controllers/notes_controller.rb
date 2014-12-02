class NotesController < ApplicationController
	def index
		
	end

	def new
	end

	def create
		if request.xhr?
			puts "OMGOMGOMGOMGOMGOMGOMGOMGOMG"
		end
		project = Project.find(params[:project_id])
		redirect_to project
	end

	def show

	end
end
