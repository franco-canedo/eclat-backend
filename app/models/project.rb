class Project < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar
    has_many :project_pictures, :dependent => :delete_all
end
