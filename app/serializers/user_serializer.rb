class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :birthdate, :location, :name

  has_many :posts
end
