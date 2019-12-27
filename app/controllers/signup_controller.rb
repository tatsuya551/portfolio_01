class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    if User.create(user_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day)
  end
end
