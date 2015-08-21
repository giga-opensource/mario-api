class ProjectSerializer < ActiveModel::Serializer
  cache key: 'updated_at'

  attributes :id, :name, :description

  belongs_to :creator

end
