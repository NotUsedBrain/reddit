class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))
    if @post.save
      redirect_to community_communities_post_path(@post.community, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :community_id)
  end
end