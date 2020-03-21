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
    @impressions = Impression.where(book_id: @book.id).order("created_at DESC")
    # 総合評価の平均点の計算
    @rating =       ((@book.impressions.rating_one_point.count +
                     @book.impressions.rating_two_points.count * 2 +
                     @book.impressions.rating_three_points.count * 3 +
                     @book.impressions.rating_four_points.count * 4 +
                     @book.impressions.rating_five_points.count * 5) / @book.impressions.count.to_f).round(2)
    # クラフ用の各平均点の計算
    gon.interest =  ((@book.impressions.interest_one_point.count +
                     @book.impressions.interest_two_points.count * 2 +
                     @book.impressions.interest_three_points.count * 3 +
                     @book.impressions.interest_four_points.count * 4 +
                     @book.impressions.interest_five_points.count * 5) / @book.impressions.count.to_f).round(2)
    gon.impressed =  ((@book.impressions.impressed_one_point.count +
                     @book.impressions.impressed_two_points.count * 2 +
                     @book.impressions.impressed_three_points.count * 3 +
                     @book.impressions.impressed_four_points.count * 4 +
                     @book.impressions.impressed_five_points.count * 5) / @book.impressions.count.to_f).round(2)
    gon.awareness =  ((@book.impressions.awareness_one_point.count +
                     @book.impressions.awareness_two_points.count * 2 +
                     @book.impressions.awareness_three_points.count * 3 +
                     @book.impressions.awareness_four_points.count * 4 +
                     @book.impressions.awareness_five_points.count * 5) / @book.impressions.count.to_f).round(2)
    gon.impact =     ((@book.impressions.impact_one_point.count +
                      @book.impressions.impact_two_points.count * 2 +
                      @book.impressions.impact_three_points.count * 3 +
                      @book.impressions.impact_four_points.count * 4 +
                      @book.impressions.impact_five_points.count * 5) / @book.impressions.count.to_f).round(2)
    gon.practice =    ((@book.impressions.practice_one_point.count +
                       @book.impressions.practice_two_points.count * 2 +
                       @book.impressions.practice_three_points.count * 3 +
                       @book.impressions.practice_four_points.count * 4 +
                       @book.impressions.practice_five_points.count * 5) / @book.impressions.count.to_f).round(2)
    gon.knowledge =   ((@book.impressions.knowledge_one_point.count +
                      @book.impressions.knowledge_two_points.count * 2 +
                      @book.impressions.knowledge_three_points.count * 3 +
                      @book.impressions.knowledge_four_points.count * 4 +
                      @book.impressions.knowledge_five_points.count * 5) / @book.impressions.count.to_f).round(2)
  end

  def show
    @impressions = Impression.where(book_id: @book.id).order("created_at DESC")
    # 総合評価の値の取り出し
    @rating = if @impression.rating == "one_point"
                1
              elsif @impression.rating == "two_points"
                2
              elsif @impression.rating == "three_points"
                3
              elsif @impression.rating == "four_points"
                4
              else
                5
              end

    # グラフ用の値の取り出し
    gon.interest = if @impression.interest == "one_point"
                     1
                   elsif @impression.interest == "two_points"
                     2
                   elsif @impression.interest == "three_points"
                     3
                   elsif @impression.interest == "four_points"
                     4
                   else
                     5
                   end

    gon.impressed = if @impression.impressed == "one_point"
                      1
                    elsif @impression.impressed == "two_points"
                      2
                    elsif @impression.impressed == "three_points"
                      3
                    elsif @impression.impressed == "four_points"
                      4
                    else
                      5
                    end

    gon.awareness = if @impression.awareness == "one_point"
                      1
                    elsif @impression.awareness == "two_points"
                      2
                    elsif @impression.awareness == "three_points"
                      3
                    elsif @impression.awareness == "four_points"
                      4
                    else
                      5
                    end

    gon.impact = if @impression.impact == "one_point"
                   1
                 elsif @impression.impact == "two_points"
                   2
                 elsif @impression.impact == "three_points"
                   3
                 elsif @impression.impact == "four_points"
                   4
                 else
                   5
                 end

    gon.practice = if @impression.practice == "one_point"
                     1
                   elsif @impression.practice == "two_points"
                     2
                   elsif @impression.practice == "three_points"
                     3
                   elsif @impression.practice == "four_points"
                     4
                   else
                     5
                   end

    gon.knowledge = if @impression.knowledge == "one_point"
                      1
                    elsif @impression.knowledge == "two_points"
                      2
                    elsif @impression.knowledge == "three_points"
                      3
                    elsif @impression.knowledge == "four_points"
                      4
                    else
                      5
                    end
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
    @notices = Notice.where(user_id: @book.user.following_ids).where(date: Date.today - 7..Date.today).order("created_at DESC").limit(10)
  end

  def set_impression
    @impression = Impression.find(params[:id])
  end
end
