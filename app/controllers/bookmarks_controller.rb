class BookmarksController < ApplicationController
  def index
    bookmarked_posts = current_user.bookmarked_posts.map{|p| PostSerializer.new(p)}
    render json: { savedPosts: bookmarked_posts }, status: :accepted
  end

  def create
    bookmarked_post = current_user.bookmarks.build(bookmark_params)
    bookmarked_post.save
    render json: { message: "Post added successfully!" }, status: :created
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:post_id)
  end
end
