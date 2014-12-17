class BranchesController < ApplicationController
  def index
    
  end

  def show
    respond_to do |format|
      format.html do
        # do the html stuff here
      end

      format.json do
        # do the json stuff here
      end
    end
    
    if params[:branch_name].present?
      
    else
      branch = Branch.find(params[:id])
    end
    render json: branch
  end

  def create
    branch = CreateBranch.new(branch_params).call
    commit_index = FindCommitNumber.new(commit: Commit.find(branch.head_commit_id), branch_id: branch.id).call
    render json: { "branch" => branch, "commit_index" => commit_index }  
  end

  def new
  end

  def update
  end

  def destroy
  end

  private

  def branch_params
    params.require(:branch).permit(:branch_name, :current_branch_id, :from_commit_id, :notes)
  end
end
