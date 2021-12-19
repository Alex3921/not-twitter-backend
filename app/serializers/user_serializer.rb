class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :birthdate, :location, :name

  has_many :followers
  has_many :followed_users
  # has_many :posts
end








