class BranchSerializer < ActiveModel::Serializer
  attributes :id, :branch_name, :head_commit_id
end
