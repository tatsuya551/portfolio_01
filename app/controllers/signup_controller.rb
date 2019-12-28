class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.create(user_params)
      redirect_to users_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day)
  end
end
