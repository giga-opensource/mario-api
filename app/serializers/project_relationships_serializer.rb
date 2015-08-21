class ProjectRelationshipsSerializer < ActiveModel::Serializer

  cache key: 'project-relationships'

  attributes :id, :trackers, :priorities, :target_versions

end
