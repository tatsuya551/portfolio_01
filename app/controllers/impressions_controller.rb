class ImpressionsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @impression = Impression.new
  end

  def create
    book = Book.find(params[:book_id])
    if Impression.create(impression_params)
      book.already_read
      book.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  private
  def impression_params
    params.require(:impression).permit(
      :book_id,
      :read_day,
      :interest,
      :impressed,
      :awareness,
      :impact,
      :practice,
      :knowledge,
      :rating,
      :reread_timing,
      :note
    ).merge(book_id: params[:book_id])
  end
end