class BranchSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :head_commit
end
