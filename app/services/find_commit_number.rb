#TODO change the name of this class this is not what it does at all
class FindCommitNumber
  def initialize(project: )
    @project = project
  end

  def call
    Commit.where(project: @project).pluck(:number).max + 1
  end
end