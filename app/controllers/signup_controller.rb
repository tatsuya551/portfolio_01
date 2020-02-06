class SignupController < ApplicationController
  before_action :birthday_add, only: [:create]


  def new
    @user = User.new
  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    params[:user][:birth_day] = @birth_date.to_s
    @user = User.new(user_params)
    if @user.save(user_params)
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:birth_day] = user_params[:birth_day]
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def logout
  end

  def start_app
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day)
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
