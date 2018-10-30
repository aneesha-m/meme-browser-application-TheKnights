class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    #@comment = @commentable.comments.find(params[:id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Your comment was successfully updated"
    else
      render 'index'
    end
  end

  def show
    redirect_back fallback_location: root_path
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_back fallback_location: root_path, notice: 'Your comment was successfully posted!'
    else
      redirect_back fallback_location: root_path, notice: "Your comment wasn't posted!"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end

end