class BranchSerializer < ActiveModel::Serializer
  attributes :id, :name
  #TODO removed the head_commit from this serializer because it is fucking the commit serializer up looking for a commit that doesnt exist
  # has_one :head_commit
end
