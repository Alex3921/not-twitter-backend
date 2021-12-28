class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :bio, :birthdate, :location, :name, :created_at

  has_many :followers
  has_many :followed_users
  # has_many :posts
end








