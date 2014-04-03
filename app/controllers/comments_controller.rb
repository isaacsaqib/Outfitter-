class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to("/users/#{current_user.id}")
      else
        render :new
      end
  end

  private
  def comment_params
  params.require(:comment).permit(:outfit_id, :user_id, :text_section)
  end
end
