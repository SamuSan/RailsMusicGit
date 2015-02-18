class CollectCommits #TODO CollectAncestoralCommits
  def initialize(commit)
    @commit = commit
  end

  def call
    commit_enumerator.to_a
  end

  private

  def commit_enumerator
    Enumerator.new do |yielder|
      commit = @commit
      begin
        yielder << commit
        commit = commit.parent_commit
      end while commit
    end
  end
end