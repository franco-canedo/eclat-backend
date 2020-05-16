class ProjectPictureSerializer < ActiveModel::Serializer
  attributes :id, :address, :project_id, :photo, :avatar
end
