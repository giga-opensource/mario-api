class ProjectSerializer < ActiveModel::Serializer
  cache key: 'updated_at'

  attributes :id, :name, :description

  belongs_to :creator
  has_many :trackers
  has_many :priorities
  has_many :target_versions

end
