# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable

  def create
    super
    @book = @commentable
    @render_file = 'books/show'
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
