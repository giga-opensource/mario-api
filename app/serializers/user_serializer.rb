class UserSerializer < ActiveModel::Serializer
  cache key: 'updated_at'
  attributes :id, :email, :username
end
