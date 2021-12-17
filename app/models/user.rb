class User < ApplicationRecord
  has_many :posts
  has_many :retweets
  has_many :reposts, through: :retweets, source: :post

end
