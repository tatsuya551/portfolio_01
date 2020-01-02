class UsersController < ApplicationController
  def index
    @users = User.order("created_at DESC").limit(10)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
end
