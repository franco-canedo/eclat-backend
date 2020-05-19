class User < ApplicationRecord
    has_secure_password
    has_many :pictures
    has_many :projects
    has_one_attached :photo
end
