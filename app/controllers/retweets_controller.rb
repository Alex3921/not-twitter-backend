class RetweetsController < ApplicationController
  def create
    retweet_post = current_user.retweets.build(retweet_params)
    retweet_post.save
    author_name = Post.find(retweet_post.post_id).author.name

    render json: { message: "You shared #{author_name}'s post!" }, status: :created
  end

  private
  def retweet_params
    params.require(:retweet).permit(:post_id)
  end
end
