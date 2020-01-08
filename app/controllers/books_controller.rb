class BooksController < ApplicationController
  before_action :set_books, only: [:show, :edit, :update, :destroy]
  before_action :buydate_add, only: [:create, :update]

  def new
    @book = Book.new
  end

  def create
    params[:book][:buy_date] = @buy_date.to_s
    @book = Book.new(book_params)
    if @book.save(book_params)
      redirect_to user_path(@book.user_id)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @book[:buy_date] = @buy_date.to_s
    if @book.update(book_params)
      redirect_to user_path(@book.user_id)
    else
      render 'show'
    end
  end

  def destroy
    if @book.destroy
      redirect_to user_path(@book.user_id)
    else
      render 'show'
    end
  end

  def search
    @books = Book.search(params[:keyword]).where.not(user_id: current_user.id)
    @keyword = params[:keyword]
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
