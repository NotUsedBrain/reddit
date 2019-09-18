class PostsController < ApplicationController

  def new
    @post = current_user.posts.build
  end

  def create
    @community = Community.find(params[:community_id])
    @post = @community.posts.create(params[:post].permit(:title, :content))

    redirect_to community_path(@community)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @community = Community.find(params[:community_id])
    @post = @community.posts.find(params[:id])
    @post.destroy
    redirect_to post_path(@post)
  end

end
