class UsersController < ApplicationController
  before_action :birthday_add, only: [:update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.order("created_at DESC").limit(10)
  end

  def show
    @books = @user.books
    # グラフ用の値の取り出し
    gon.novel = @user.books.category_小説.count
    gon.management = @user.books.category_経営・戦略.count
    gon.economy = @user.books.category_政治・経済.count
    gon.finance = @user.books.category_金融・ファイナンス.count
    gon.it = @user.books.category_IT.count
    gon.motivation = @user.books.category_自己啓発.count
    gon.talent = @user.books.category_タレント本.count
    gon.etc = @user.books.category_その他.count
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

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def birthday_add
    birthday = params[:birth_day]
    @birth_date = Date.new(birthday["birth_day(1i)"].to_i,birthday["birth_day(2i)"].to_i,birthday["birth_day(3i)"].to_i)
  end
end
