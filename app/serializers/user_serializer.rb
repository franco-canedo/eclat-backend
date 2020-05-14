class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :photos, :motto, :who_we_are, :company_name, :company_address, :email, :phone_number
end
