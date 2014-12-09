class NoteSerializer < ActiveModel::Serializer
  attributes :id, :position, :duration, :frequency
end
