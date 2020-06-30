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
    # 各合計点の計算
    point_hash = { rating: 0, interest: 0, impressed: 0, awareness: 0, impact: 0, practice: 0, knowledge: 0 }
    @impressions.each do |imp|
      point_hash[:rating] += imp.get_point(imp.rating)
      point_hash[:interest] += imp.get_point(imp.interest)
      point_hash[:impressed] += imp.get_point(imp.impressed)
      point_hash[:awareness] += imp.get_point(imp.awareness)
      point_hash[:impact] += imp.get_point(imp.impact)
      point_hash[:practice] += imp.get_point(imp.practice)
      point_hash[:knowledge] += imp.get_point(imp.knowledge)
    end
    # 各平均点の計算
    @rating = point_avg(point_hash[:rating])
    gon.interest = point_avg(point_hash[:interest])
    gon.impressed = point_avg(point_hash[:impressed])
    gon.awareness = point_avg(point_hash[:awareness])
    gon.impact = point_avg(point_hash[:impact])
    gon.practice = point_avg(point_hash[:practice])
    gon.knowledge = point_avg(point_hash[:knowledge])
  end

  def show
    @impressions = @book.impressions.sorted
    # 総合評価の値の取り出し
    @rating = @impression.get_point(@impression.rating)
    # グラフ用の値の取り出し
    gon.interest = @impression.get_point(@impression.interest)
    gon.impressed = @impression.get_point(@impression.impressed)
    gon.awareness = @impression.get_point(@impression.awareness)
    gon.practice = @impression.get_point(@impression.practice)
    gon.impact = @impression.get_point(@impression.impact)
    gon.knowledge = @impression.get_point(@impression.knowledge)
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

  def point_avg(point_value)
    (point_value / @impressions.count.to_f).round(2)
  end
end
