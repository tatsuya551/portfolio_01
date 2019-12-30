class BooksController < ApplicationController
  before_action :set_books, only: [:show, :edit]
  
  def new
    @book = Book.new
  end

  def create
    if Book.create(book_params)
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if Book.update(book_params)
      redirect_to users_path
    else
      render 'show'
    end
  end

  private
  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :publisher,
      :reason,
      :date,
      :image
    ).merge(user_id: current_user.id)
  end

  def set_books
    @book = Book.find(params[:id])
  end
end
