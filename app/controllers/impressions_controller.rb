class ImpressionsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @impression = Impression.new
  end

  def create
    if Impression.create(impression_params)
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:book_id])
    @impressions = Impression.where(book_id: @book.id)
    @rating = ((@book.impressions.rating_１点.count +
               (@book.impressions.rating_２点.count)*2 +
               (@book.impressions.rating_３点.count)*3 +
               (@book.impressions.rating_４点.count)*4 + 
               (@book.impressions.rating_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.interest = ((@book.impressions.interest_１点.count +
                    (@book.impressions.interest_２点.count)*2 +
                    (@book.impressions.interest_３点.count)*3 +
                    (@book.impressions.interest_４点.count)*4 + 
                    (@book.impressions.interest_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.impressed = ((@book.impressions.impressed_１点.count +
                    (@book.impressions.impressed_２点.count)*2 +
                    (@book.impressions.impressed_３点.count)*3 +
                    (@book.impressions.impressed_４点.count)*4 + 
                    (@book.impressions.impressed_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.awareness = ((@book.impressions.awareness_１点.count +
                    (@book.impressions.awareness_２点.count)*2 +
                    (@book.impressions.awareness_３点.count)*3 +
                    (@book.impressions.awareness_４点.count)*4 + 
                    (@book.impressions.awareness_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.impact = ((@book.impressions.impact_１点.count +
                 (@book.impressions.impact_２点.count)*2 +
                 (@book.impressions.impact_３点.count)*3 +
                 (@book.impressions.impact_４点.count)*4 + 
                 (@book.impressions.impact_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.practice = ((@book.impressions.practice_１点.count +
                   (@book.impressions.practice_２点.count)*2 +
                   (@book.impressions.practice_３点.count)*3 +
                   (@book.impressions.practice_４点.count)*4 + 
                   (@book.impressions.practice_５点.count)*5)/@book.impressions.count.to_f).round(2)
    gon.knowledge = ((@book.impressions.knowledge_１点.count +
                    (@book.impressions.knowledge_２点.count)*2 +
                    (@book.impressions.knowledge_３点.count)*3 +
                    (@book.impressions.knowledge_４点.count)*4 + 
                    (@book.impressions.knowledge_５点.count)*5)/@book.impressions.count.to_f).round(2)
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