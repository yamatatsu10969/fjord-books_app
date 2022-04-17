# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  def new
    @comment = current_user.comments.new(commentable: @commentable)
  end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
