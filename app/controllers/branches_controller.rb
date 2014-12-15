class BranchesController < ApplicationController
  def index
    
  end

  def show
    branch = Branch.where(branch_name:params[:id]).first!

    render json: branch
  end

  def create
    from_commit  = Commit.find(params[:from_commit_id])
    CreateBranch.new(branch_name:params[:branch_name], from_commit: from_commit).call
    render partial: 'projects/project_management'
  end

  def new
  end

  def update
  end

  def destroy
  end
end
