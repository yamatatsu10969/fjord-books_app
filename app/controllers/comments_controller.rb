# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    # @comment = @commentable.comments.new(comment_params)
    @comment = Comment.new
    @comment.user = current_user
    @comment.save
    # @comment.errors.add(:user, 'must be logged in')
    # redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human) if @comment.save
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    @comment.update!(comment_params)
    redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
