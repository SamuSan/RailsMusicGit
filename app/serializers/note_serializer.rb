class NoteSerializer < ActiveModel::Serializer
  attributes :id, :position, :duration, :frequency, :commit_id 
end
