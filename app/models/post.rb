class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :user_id

  has_many :replies, class_name: "Post", foreign_key: :in_reply_to_post_id
  has_many :likes
  has_many :retweets

  def add_bookmark(current_user, bookmark_params)
    bookmarked_post = current_user.bookmarks.build(bookmark_params)
    bookmarked_post.save
  end

  def remove_bookmark(user_id)
    bookmark = Bookmark.select{|b| b.post_id == self.id && b.user_id == user_id}
    Bookmark.delete(bookmark)
  end
end
