class UsersController < ApplicationController
  def index
    @books = current_user.books
  end
end
