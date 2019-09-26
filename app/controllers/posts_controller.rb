class PostsController < ApplicationController

  def create
    @community = Community.find(params[:community_id])

    @post = @community.posts.create(params[:post].permit(:title, :content))
    @post.user = current_user
    @post.save

    redirect_to community_path(@community)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @community = Community.find(params[:community_id])
    @post = @community.posts.find(params[:id])
    @post.destroy
    redirect_to community_post_path(@post.community, @post)
  end

end
