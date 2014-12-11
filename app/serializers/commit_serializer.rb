class CommitSerializer < ActiveModel::Serializer
  attributes :id

  has_many :notes
end
