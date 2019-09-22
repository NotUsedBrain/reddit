class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user = current_user
    @comment.save

    redirect_to community_post_comment_path(@community, @post.comments, @comment)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
