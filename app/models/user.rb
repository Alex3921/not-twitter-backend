class User < ApplicationRecord
  has_secure_password
  
  has_many :posts

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  
  has_many :retweets
  has_many :reposts, through: :retweets, source: :post

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def followed_users_posts
    posts = []
    followed_users.each do |u| 
      u.posts.each do |post| 
        posts << post
      end
    end
    posts
  end

  def replies
    self.posts.select{|post| post.in_reply_to_post_id != nil}
  end

end
