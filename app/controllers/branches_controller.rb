class BranchesController < ApplicationController
  def index
    
  end

  def show
    render json: Branch.find(params[:branch_id])
  end

  def create
    from_commit  = Commit.find(params[:from_commit_id])
    CreateBranch.new(branch_name:params[:branch_name], from_commit: from_commit).call
    render partial: 'projects/project_management'
  end

  def new
    
  end

  def destroy
    
  end
end
