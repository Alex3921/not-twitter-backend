class BookmarksController < ApplicationController
  def index
    bookmarked_posts = current_user.bookmarked_posts.map{|p| PostSerializer.new(p)}
    render json: { savedPosts: bookmarked_posts }, status: :accepted
  end

  def create
    post = Post.find(bookmark_params[:post_id])
    if current_user.bookmarks.exists?(post_id: bookmark_params[:post_id])
      post.remove_bookmark(current_user.id)
      render json: { message: "Post removed from Bookmarks!" }, status: :accepted
    else
      post.add_bookmark(current_user, bookmark_params)
      render json: { message: "Post added to your Bookmarks!" }, status: :created
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:post_id)
  end
end