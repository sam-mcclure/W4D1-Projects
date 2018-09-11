class CommentsController < ApplicationController
  def index
    comment = Comment.all
    render json: comment
  end
  
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end
    
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
  