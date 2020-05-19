class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :photo, :motto, :who_we_are, :company_name, :company_address, :email, :phone_number,
    :projects, :avatar
end
