class StatusSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :name
end
