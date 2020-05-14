class User < ApplicationRecord
    has_secure_password
    has_many :pictures
    has_many_attached :photos
end
