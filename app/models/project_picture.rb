class ProjectPicture < ApplicationRecord
    belongs_to :project
    has_one_attached :avatar
end
