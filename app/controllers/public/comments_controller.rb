class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js { render 'create_error' }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
