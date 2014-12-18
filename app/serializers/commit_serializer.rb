class CommitSerializer < ActiveModel::Serializer
  attributes :id, :number, :parent_commit_id
  has_many :notes
end
