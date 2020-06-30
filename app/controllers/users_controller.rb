class UsersController < ApplicationController
  before_action :birthday_add, only: [:update]
  before_action :set_user, :set_user_notice, only: [:show,
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
                                                    :followers,
                                                    :read_count_books,
                                                    :read_history]
  before_action :set_user_impression, only: [:show,
                                             :reread_timing,
                                             :timing_knowledge,
                                             :timing_motivation,
                                             :timing_decision,
                                             :timing_stress,
                                             :timing_feel_down,
                                             :timing_lost_love,
                                             :timing_diversion,
                                             :timing_relax,
                                             :read_count_books]

  def show
    @followers = @user.followers
    @followings = @user.followings
    @buy_books = @user.books.impression_none.sorted.limit(5)
    @read_books_impressions = @impressions.sorted.limit(5)
    @will_read_books = @user.books.book_following.sorted.limit(5)
    @read_count_impressions = @impressions.read_count.sorted.limit(5)
    # グラフ用の値の取り出し
    gon.novel = @user.books.category_novel.no_book_following.count
    gon.management = @user.books.category_management.no_book_following.count
    gon.economy = @user.books.category_economy.no_book_following.count
    gon.finance = @user.books.category_finance.no_book_following.count
    gon.it = @user.books.category_it.no_book_following.count
    gon.motivation = @user.books.category_motivation.no_book_following.count
    gon.talent = @user.books.category_talent.no_book_following.count
    gon.etc = @user.books.category_etc.no_book_following.count
  end

  def edit; end

  def update
    @user[:birth_day] = @birth_date.to_s
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def category
    @novels = @user.books.category_novel.no_book_following.sorted.limit(5)
    @managements = @user.books.category_management.no_book_following.sorted.limit(5)
    @economys = @user.books.category_economy.no_book_following.sorted.limit(5)
    @finances = @user.books.category_finance.no_book_following.sorted.limit(5)
    @its = @user.books.category_it.no_book_following.sorted.limit(5)
    @motivations = @user.books.category_motivation.no_book_following.sorted.limit(5)
    @talents = @user.books.category_talent.no_book_following.sorted.limit(5)
    @etcs = @user.books.category_etc.no_book_following.sorted.limit(5)
  end

  def novel
    @novels = @user.books.category_novel.no_book_following.sorted
  end

  def management
    @managements = @user.books.category_management.no_book_following.sorted
  end

  def economy
    @economys = @user.books.category_economy.no_book_following.sorted
  end

  def finance
    @finances = @user.books.category_finance.no_book_following.sorted
  end

  def it
    @its = @user.books.category_it.no_book_following.sorted
  end

  def motivation
    @motivations = @user.books.category_motivation.no_book_following.sorted
  end

  def talent
    @talents = @user.books.category_talent.no_book_following.sorted
  end

  def etc
    @etcs = @user.books.category_etc.no_book_following.sorted
  end

  def reread_timing
    @timing_knowledges = @impressions.knowledge
    @timing_motivations = @impressions.motivation
    @timing_decisions = @impressions.decision
    @timing_stresses = @impressions.stress
    @timing_feel_downs = @impressions.feel_down
    @timing_lost_loves = @impressions.lost_love
    @timing_diversions = @impressions.diversion
    @timing_relaxes = @impressions.relax
  end

  def timing_knowledge
    @timing_knowledges = @impressions.knowledge.sorted
  end

  def timing_motivation
    @timing_motivations = @impressions.motivation.sorted
  end

  def timing_decision
    @timing_decisions = @impressions.decision.sorted
  end

  def timing_stress
    @timing_stresses = @impressions.stress.sorted
  end

  def timing_feel_down
    @timing_feel_downs = @impressions.feel_down.sorted
  end

  def timing_lost_love
    @timing_lost_loves = @impressions.lost_love.sorted
  end

  def timing_diversion
    @timing_diversions = @impressions.diversion.sorted
  end

  def timing_relax
    @timing_relaxes = @impressions.relax.sorted
  end

  def all_books
    @all_books = @user.books.no_book_following.sorted
  end

  def read_books
    @read_books = @user.books.impression_exist.sorted
  end

  def will_read_books
    @will_read_books = @user.books.impression_none.sorted
  end

  def follow_book
    @follow_books = @user.books.book_following.sorted
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def read_count_books
    @read_once_impressions = @impressions.read_once.sorted
    @read_twice_impressions = @impressions.read_twice.sorted
    @read_three_impressions = @impressions.read_three.sorted
  end

  def read_history
    @historys = Notice.search_user(@user.id).impression_register_exist.sorted
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_notice
    @notices = Notice.search_user(@user.following_ids).last_seven_days.sorted.limit(10)
  end

  def set_user_impression
    @impressions = Impression.where(book_id: @user.books.ids)
  end

  def birthday_add
    if params[:birth_day]["birth_day(1i)"].present? && params[:birth_day]["birth_day(2i)"].present? && params[:birth_day]["birth_day(3i)"].present?
      birthday = params[:birth_day]
      @birth_date = Date.new(birthday["birth_day(1i)"].to_i, birthday["birth_day(2i)"].to_i, birthday["birth_day(3i)"].to_i)
    end
  end
end
