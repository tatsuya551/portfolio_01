class BooksController < ApplicationController
  before_action :set_books, only: [:show, :edit, :destroy]
  before_action :buydate_add, only: [:create]

  def new
    @book = Book.new
  end

  def create
    params[:book][:buy_date] = @buy_date.to_s
    @book = Book.new(book_params)
    if @book.save(book_params)
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

  def destroy
    if @book.destroy
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
      :category,
      :buy_date,
      :image
    ).merge(user_id: current_user.id)
  end

  def set_books
    @book = Book.find(params[:id])
  end

  def buydate_add
    date = params[:buy_date]
    @buy_date = Date.new(date["buy_date(1i)"].to_i,date["buy_date(2i)"].to_i,date["buy_date(3i)"].to_i)
  end
end
