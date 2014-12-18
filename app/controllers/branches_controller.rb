class BranchesController < ApplicationController
  def index
    
  end

  def show
    branch = Branch.find(params[:id])
    render json: branch
  end

  def create
    branch = CreateBranch.new(branch_params: branch_params).call
    render json: branch
  end

  def new
  end

  def update
  end

  def destroy
  end

  private

  def branch_params
    params.require(:branch).permit(:name, :current_branch_id, :from_commit_id)
  end
end
