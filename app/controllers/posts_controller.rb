class PostsController < ApplicationController
  def home
    followed_users_posts = current_user.followed_users_posts.map{|p| PostSerializer.new(p)}
    render json: { homePosts: followed_users_posts }, status: :accepted
  end

  def profile
    user_posts = current_user.posts.map{|p| PostSerializer.new(p)}
    render json: { userPosts: user_posts }, status: :accepted
  end

  def show

  end

  def create
    post = current_user.posts.build(post_params)
    post.save
    render json: {post: PostSerializer.new(post)}, status: :created
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
