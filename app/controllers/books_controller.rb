class BooksController < ApplicationController
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
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :reason, :date, :image).merge(user_id: current_user.id)
  end
end
