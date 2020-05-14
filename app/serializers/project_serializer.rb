class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :address, :beds, :baths, :completion_date, :user_id, :project_pictures
end
