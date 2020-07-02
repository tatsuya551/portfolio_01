class ImpressionsController < ApplicationController
  before_action :set_books, :set_user_notice, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  before_action :set_impression, only: [:show, :edit, :update, :destroy]

  def new
    @impression = Impression.new
  end

  def create
    @impression = Impression.create(impression_params)
    if @impression.save
      @impression.book.book_read
      notice = Notice.new
      notice.notice_impression_followers(@impression.book.user, @impression)
      redirect_to book_impressions_path(@book)
    else
      render 'new'
    end
  end

  def index
    @impressions = @book.impressions.sorted
    # 各平均点の計算
    @rating = @impressions.get_avg_point(:rating)
    gon.interest = @impressions.get_avg_point(:interest)
    gon.impressed = @impressions.get_avg_point(:impressed)
    gon.awareness = @impressions.get_avg_point(:awareness)
    gon.impact = @impressions.get_avg_point(:impact)
    gon.practice = @impressions.get_avg_point(:practice)
    gon.knowledge = @impressions.get_avg_point(:knowledge)
  end

  def show
    @impressions = @book.impressions.sorted
    # 総合評価の値の取り出し
    @rating = @impression.get_point(:rating)
    # グラフ用の値の取り出し
    gon.interest = @impression.get_point(:interest)
    gon.impressed = @impression.get_point(:impressed)
    gon.awareness = @impression.get_point(:awareness)
    gon.practice = @impression.get_point(:practice)
    gon.impact = @impression.get_point(:impact)
    gon.knowledge = @impression.get_point(:knowledge)
  end

  def edit; end

  def update
    if @impression.update(impression_params)
      redirect_to book_impression_path(@book, @impression)
    else
      render 'edit'
    end
  end

  def destroy
    if @impression.destroy
      if @book.impressions.present?
        redirect_to book_impressions_path(@book)
      else
        @book.book_impression_none
        redirect_to book_path(@book)
      end
    else
      render 'edit'
    end
  end

  private

  def impression_params
    params.require(:impression).permit(
      :book_id,
      :read_day,
      :interest,
      :impressed,
      :awareness,
      :impact,
      :practice,
      :knowledge,
      :rating,
      :reread_timing,
      :note
    ).merge(book_id: params[:book_id])
  end

  def set_books
    @book = Book.find(params[:book_id])
  end

  def set_user_notice
    @notices = Notice.search_user(@book.user.following_ids).last_seven_days.sorted.limit(10)
  end

  def set_impression
    @impression = Impression.find(params[:id])
  end
end
