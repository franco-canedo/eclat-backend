class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :photos
end
