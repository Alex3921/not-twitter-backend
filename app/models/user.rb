class User < ApplicationRecord
  has_many :posts
  has_many :retweets
  has_many :reposts, through: :retweets, source: :post

  def replies
    self.posts.select{|post| post.in_reply_to_post_id != nil}
  end

end
