class BranchesController < ApplicationController
  def index
    
  end

  def show
    branch = Branch.where(branch_name:params[:id]).first!

    render json: branch
  end

  def create
    current_branch = Branch.find(params[:currentBranchId])
    notes = JSON.parse(params[:notes]).compact
    if current_branch.needs_new_commit?(notes)
      from_commit  = CreateCommit.new().call
      CreateBranch.new(branch_name:params[:branch_name], from_commit: from_commit).call
    else

    end
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
