class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :birthdate, :location, :name
end
