class ProjectSerializer < ActiveModel::Serializer
  cache key: 'updated_at'
  attributes :id, :name, :description, :creator

  belongs_to :creator

end
