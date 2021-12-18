class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :user_id

  has_many :replies, class_name: "Post", foreign_key: :in_reply_to_post_id
  has_many :likes
  has_many :retweets
end
