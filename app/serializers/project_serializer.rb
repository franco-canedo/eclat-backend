class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :address, :beds, :baths, :completion_date, :square_feet,
   :user_id, :project_pictures, :photo, :avatar, :comment
end
