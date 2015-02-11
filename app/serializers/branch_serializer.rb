class BranchSerializer < ActiveModel::Serializer
  attributes :id, :name, :head_commit_id
end
