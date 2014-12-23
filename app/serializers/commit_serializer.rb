class CommitSerializer < ActiveModel::Serializer
  attributes :id, :number, :parent_commit_id, :next_commit_id
  has_many :notes

  def next_commit_id
    object.next_commit_towards_commit(serialization_options[:head_commit])
  end
end
