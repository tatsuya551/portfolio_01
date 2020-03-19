class BooksController < ApplicationController
  before_action :set_books, :set_user_notice, only: [:show, :edit, :update, :destroy, :follow_book_show]
  before_action :buydate_add, only: [:create]

  def new
    @book = Book.new
  end

  def create
    params[:book][:buy_date] = @buy_date.to_s
    @book = Book.new(book_params)
    if @book.save(book_params)
      notice = Notice.new
      notice.notice_book_followers(@book.user, @book)
      redirect_to user_path(@book.user_id)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if params[:commit] == " 編集を登録する "
      date = params[:buy_date]
      @buy_date = Date.new(date["buy_date(1i)"].to_i, date["buy_date(2i)"].to_i, date["buy_date(3i)"].to_i)
      @book[:buy_date] = @buy_date.to_s
      if @book.update(book_params)
        redirect_to book_path(@book)
      else
        render 'edit'
      end
    else
      @follow_book = Book.find(params[:id]).dup
      @follow_book.book_following(@book, current_user)
      redirect_to book_path(@book)
    end
  end

  def destroy
    if @book.status == "book_impression_none" || @book.status == "book_impression_exist"
      if @book.destroy
        redirect_to user_path(@book.user_id)
      else
        render 'show'
      end
    elsif @book.status == "book_following"
      if @book.destroy
        redirect_to follow_book_user_path(@book.user_id)
      else
        render 'follow_book_show'
      end
    end
  end

  def search
    if user_signed_in?
      @all_books = Book.search(params[:keyword]).where.not(user_id: current_user.id).where.not(status: "book_following").order("created_at DESC")
      @user_books = current_user.books.search(params[:keyword]).where.not(status: "book_following").order("created_at DESC")
    else
      @all_books = Book.search(params[:keyword]).where.not(status: "book_following").order("created_at DESC")
    end
    @keyword = params[:keyword]
  end

  def follow_book_show
    @user = @book.user
  end

  def index
    @books = Book.where.not(status: "book_following").order("created_at DESC")
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

  def set_user_notice
    @notices = Notice.where(user_id: @book.user.following_ids).where(date: Date.today - 7..Date.today).order("created_at DESC").limit(10)
  end

  def buydate_add
    date = params[:buy_date]
    @buy_date = Date.new(date["buy_date(1i)"].to_i, date["buy_date(2i)"].to_i, date["buy_date(3i)"].to_i)
  end
end
