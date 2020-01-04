class UsersController < ApplicationController
  def index
    @users = User.order("created_at DESC").limit(10)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    gon.novel = @user.books.category_小説.count
    gon.management = @user.books.category_経営・戦略.count
    gon.economy = @user.books.category_政治・経済.count
    gon.finance = @user.books.category_金融・ファイナンス.count
    gon.it = @user.books.category_IT.count
    gon.motivation = @user.books.category_自己啓発.count
    gon.talent = @user.books.category_タレント本.count
    gon.etc = @user.books.category_その他.count
  end
end
