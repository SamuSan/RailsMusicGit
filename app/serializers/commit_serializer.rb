class CommitSerializer < ActiveModel::Serializer
  attributes :id, :notes, :number
end
