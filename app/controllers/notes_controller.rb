class NotesController < ApplicationController
	def index
		if request.xhr?
			notes_for_commit = Commit.find(params[:commit_id]).notes
			render json: notes_for_commit
		end
	end

	def new

	end

	def create

	end

	def show

	end
end
