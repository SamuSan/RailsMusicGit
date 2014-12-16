class FindCommitByIndex
  def initialize(index, branch_id)
    @index = index
    @branch = Branch.find(branch_id)
  end

  def call
    
  end
end