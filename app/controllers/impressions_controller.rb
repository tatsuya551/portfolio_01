class ImpressionsController < ApplicationController
  before_action :set_books,:set_user_notice, only: [:new, :index, :show, :edit, :create, :update, :destroy]
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
    @rating =       ((@book.impressions.rating_１点.count +
                     (@book.impressions.rating_２点.count)*2 +
                     (@book.impressions.rating_３点.count)*3 +
                     (@book.impressions.rating_４点.count)*4 + 
                     (@book.impressions.rating_５点.count)*5)/@book.impressions.count.to_f).round(2)
    # クラフ用の各平均点の計算                 
    gon.interest =  ((@book.impressions.interest_１点.count +
                     (@book.impressions.interest_２点.count)*2 +
                     (@book.impressions.interest_３点.count)*3 +
                     (@book.impressions.interest_４点.count)*4 + 
                     (@book.impressions.interest_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.impressed =  ((@book.impressions.impressed_１点.count +
                     (@book.impressions.impressed_２点.count)*2 +
                     (@book.impressions.impressed_３点.count)*3 +
                     (@book.impressions.impressed_４点.count)*4 + 
                     (@book.impressions.impressed_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.awareness =  ((@book.impressions.awareness_１点.count +
                     (@book.impressions.awareness_２点.count)*2 +
                     (@book.impressions.awareness_３点.count)*3 +
                     (@book.impressions.awareness_４点.count)*4 + 
                     (@book.impressions.awareness_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.impact =     ((@book.impressions.impact_１点.count +
                      (@book.impressions.impact_２点.count)*2 +
                      (@book.impressions.impact_３点.count)*3 +
                      (@book.impressions.impact_４点.count)*4 + 
                      (@book.impressions.impact_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.practice =    ((@book.impressions.practice_１点.count +
                       (@book.impressions.practice_２点.count)*2 +
                       (@book.impressions.practice_３点.count)*3 +
                       (@book.impressions.practice_４点.count)*4 + 
                       (@book.impressions.practice_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.knowledge =   ((@book.impressions.knowledge_１点.count +
                      (@book.impressions.knowledge_２点.count)*2 +
                      (@book.impressions.knowledge_３点.count)*3 +
                      (@book.impressions.knowledge_４点.count)*4 + 
                      (@book.impressions.knowledge_５点.count)*5)/@book.impressions.count.to_f).round(2)
  end

  def show
    @impressions = Impression.where(book_id: @book.id).order("created_at DESC")
    # 総合評価の値の取り出し
    if @impression.rating == "１点"
      @rating = 1
    elsif @impression.rating == "２点"
      @rating = 2
    elsif @impression.rating == "３点"
      @rating = 3
    elsif @impression.rating == "４点"
      @rating = 4
    else
      @rating = 5
    end

    # グラフ用の値の取り出し
    if @impression.interest == "１点"
      gon.interest = 1
    elsif @impression.interest == "２点"
      gon.interest = 2
    elsif @impression.interest == "３点"
      gon.interest = 3
    elsif @impression.interest == "４点"
      gon.interest = 4
    else
      gon.interest = 5
    end

    if @impression.impressed == "１点"
      gon.impressed = 1
    elsif @impression.impressed == "２点"
      gon.impressed = 2
    elsif @impression.impressed == "３点"
      gon.impressed = 3
    elsif @impression.impressed == "４点"
      gon.impressed = 4
    else
      gon.impressed = 5
    end

    if @impression.awareness == "１点"
      gon.awareness = 1
    elsif @impression.awareness == "２点"
      gon.awareness = 2
    elsif @impression.awareness == "３点"
      gon.awareness = 3
    elsif @impression.awareness == "４点"
      gon.awareness = 4
    else
      gon.awareness = 5
    end

    if @impression.impact == "１点"
      gon.impact = 1
    elsif @impression.impact == "２点"
      gon.impact = 2
    elsif @impression.impact == "３点"
      gon.impact = 3
    elsif @impression.impact == "４点"
      gon.impact = 4
    else
      gon.impact = 5
    end

    if @impression.practice == "１点"
      gon.practice = 1
    elsif @impression.practice == "２点"
      gon.practice = 2
    elsif @impression.practice == "３点"
      gon.practice = 3
    elsif @impression.practice == "４点"
      gon.practice = 4
    else
      gon.practice = 5
    end

    if @impression.knowledge == "１点"
      gon.knowledge = 1
    elsif @impression.knowledge == "２点"
      gon.knowledge = 2
    elsif @impression.knowledge == "３点"
      gon.knowledge = 3
    elsif @impression.knowledge == "４点"
      gon.knowledge = 4
    else
      gon.knowledge = 5
    end
  end

  def edit
  end

  def update
    if @impression.update(impression_params)
      redirect_to book_impression_path(@book,@impression)
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
    @notices = Notice.where(user_id:@book.user.following_ids).where(date: Date.today-7..Date.today).order("created_at DESC").limit(10)
  end

  def set_impression
    @impression  = Impression.find(params[:id])
  end
end