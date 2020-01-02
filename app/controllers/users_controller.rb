class UsersController < ApplicationController
  def index
    if params[:book] == nil
    else
      @books = current_user.books
    end
  end
end
