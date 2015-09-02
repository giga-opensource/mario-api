class SessionSerializer < ActiveModel::Serializer
  cache key: 'updated_at'
  attributes :email, :username, :access_token, :id
end