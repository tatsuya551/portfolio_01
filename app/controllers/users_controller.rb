class UsersController < ApplicationController
  before_action :birthday_add, only: [:update]
  before_action :set_user, only: [:show,
                                  :edit,
                                  :update,
                                  :category,
                                  :novel,
                                  :management,
                                  :economy,
                                  :finance,
                                  :it,
                                  :motivation,
                                  :talent,
                                  :etc,
                                  :reread_timing,
                                  :timing_knowledge,
                                  :timing_motivation,
                                  :timing_decision,
                                  :timing_stress,
                                  :timing_feel_down,
                                  :timing_lost_love,
                                  :timing_diversion,
                                  :timing_relax,
                                  :all_books,
                                  :read_books,
                                  :will_read_books,
                                  :follow_book,
                                  :followings,
                                  :followers]

  def show
    @followers = @user.followers
    @followings = @user.followings
    @buy_books = @user.books.where(status:0).order("created_at DESC").limit(5)
    # @read_books = @user.books.where(status:1).order("created_at DESC").limit(5)
    @read_books_impressions = Impression.where(book_id: @user.book_ids).order("created_at DESC").limit(5)

    @will_read_books = @user.books.where(status:2).order("created_at DESC").limit(5)
    # グラフ用の値の取り出し
    gon.novel = @user.books.category_小説.where.not(status:2).count
    gon.management = @user.books.category_経営・戦略.where.not(status:2).count
    gon.economy = @user.books.category_政治・経済.where.not(status:2).count
    gon.finance = @user.books.category_金融・ファイナンス.where.not(status:2).count
    gon.it = @user.books.category_IT.where.not(status:2).count
    gon.motivation = @user.books.category_自己啓発.where.not(status:2).count
    gon.talent = @user.books.category_タレント本.where.not(status:2).count
    gon.etc = @user.books.category_その他.where.not(status:2).count
  end

  def edit
  end

  def update
    @user[:birth_day] = @birth_date.to_s
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def category
    @novels = @user.books.category_小説.where.not(status:2).order("created_at DESC").limit(5)
    @managements = @user.books.category_経営・戦略.where.not(status:2).order("created_at DESC").limit(5)
    @economys = @user.books.category_政治・経済.where.not(status:2).order("created_at DESC").limit(5)
    @finances = @user.books.category_金融・ファイナンス.where.not(status:2).order("created_at DESC").limit(5)
    @its = @user.books.category_IT.where.not(status:2).order("created_at DESC").limit(5)
    @motivations = @user.books.category_自己啓発.where.not(status:2).order("created_at DESC").limit(5)
    @talents = @user.books.category_タレント本.where.not(status:2).order("created_at DESC").limit(5)
    @etcs = @user.books.category_その他.where.not(status:2).order("created_at DESC").limit(5)
  end

  def novel
    @novels = @user.books.category_小説.where.not(status:2).order("created_at DESC")
  end

  def management
    @managements = @user.books.category_経営・戦略.where.not(status:2).order("created_at DESC")
  end

  def economy
    @economys = @user.books.category_政治・経済.where.not(status:2).order("created_at DESC")
  end

  def finance
    @finances = @user.books.category_金融・ファイナンス.where.not(status:2).order("created_at DESC")
  end

  def it
    @its = @user.books.category_IT.where.not(status:2).order("created_at DESC")
  end

  def motivation
    @motivations = @user.books.category_自己啓発.where.not(status:2).order("created_at DESC")
  end

  def talent
    @talents = @user.books.category_タレント本.where.not(status:2).order("created_at DESC")
  end

  def etc
    @etcs = @user.books.category_その他.where.not(status:2).order("created_at DESC")
  end

  def reread_timing
    @timing_knowledges = Impression.where(book_id:@user.books.ids).where(reread_timing:"知識を付けたい時")
    @timing_motivations = Impression.where(book_id:@user.books.ids).where(reread_timing:"モチベーションをあげたい時")
    @timing_decisions = Impression.where(book_id:@user.books.ids).where(reread_timing:"なにか決断をする時")
    @timing_stresses = Impression.where(book_id:@user.books.ids).where(reread_timing:"ストレスが溜まっている時")
    @timing_feel_downs = Impression.where(book_id:@user.books.ids).where(reread_timing:"落ち込んでいる時")
    @timing_lost_loves = Impression.where(book_id:@user.books.ids).where(reread_timing:"失恋した時")
    @timing_diversions = Impression.where(book_id:@user.books.ids).where(reread_timing:"気分転換したい時")
    @timing_relaxes = Impression.where(book_id:@user.books.ids).where(reread_timing:"リラックスしたい時")
  end

  def timing_knowledge
    @timing_knowledges = Impression.where(book_id:@user.books.ids).where(reread_timing:"知識を付けたい時").order("created_at DESC")
  end

  def timing_motivation
    @timing_motivations = Impression.where(book_id:@user.books.ids).where(reread_timing:"モチベーションをあげたい時").order("created_at DESC")
  end

  def timing_decision
    @timing_decisions = Impression.where(book_id:@user.books.ids).where(reread_timing:"なにか決断をする時").order("created_at DESC")
  end

  def timing_stress
    @timing_stresses = Impression.where(book_id:@user.books.ids).where(reread_timing:"ストレスが溜まっている時").order("created_at DESC")
  end

  def timing_feel_down
    @timing_feel_downs = Impression.where(book_id:@user.books.ids).where(reread_timing:"落ち込んでいる時").order("created_at DESC")
  end

  def timing_lost_love
    @timing_lost_loves = Impression.where(book_id:@user.books.ids).where(reread_timing:"失恋した時").order("created_at DESC")
  end

  def timing_diversion
    @timing_diversions = Impression.where(book_id:@user.books.ids).where(reread_timing:"気分転換したい時").order("created_at DESC")
  end

  def timing_relax
    @timing_relaxes = Impression.where(book_id:@user.books.ids).where(reread_timing:"リラックスしたい時").order("created_at DESC")
  end

  def all_books
    @all_books = @user.books.where.not(status:2).order("created_at DESC")
  end

  def read_books
    @read_books = @user.books.where(status:1).order("created_at DESC")
  end

  def will_read_books
    @will_read_books = @user.books.where(status:0).order("created_at DESC")
  end

  def follow_book
    @follow_books = @user.books.where(status:2).order("created_at DESC")
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def birthday_add
    if params[:birth_day]["birth_day(1i)"].present? && params[:birth_day]["birth_day(2i)"].present? && params[:birth_day]["birth_day(3i)"].present?
      birthday = params[:birth_day]
      @birth_date = Date.new(birthday["birth_day(1i)"].to_i,birthday["birth_day(2i)"].to_i,birthday["birth_day(3i)"].to_i)
    else
      return
    end
  end
end
