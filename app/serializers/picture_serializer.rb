class PictureSerializer < ActiveModel::Serializer
  attributes :id, :address, :photo, :avatar, :url
end
