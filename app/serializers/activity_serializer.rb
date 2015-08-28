class ActivitySerializer < ActiveModel::Serializer

  cache key: 'updated_at'

  attributes :id, :kind, :issue_id, :original, :transformed, :updated_at

  belongs_to :creator

end
