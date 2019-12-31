class UsersController < ApplicationController
  def index
    @books = current_user.books
    gon.reason = current_user.books.count
  end
end
