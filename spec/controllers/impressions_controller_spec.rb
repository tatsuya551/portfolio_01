require 'rails_helper'

describe ImpressionsController do
  describe 'GET #new' do
    it "renders the :new template" do
      book = create(:book)
      get :new, params: { book_id: book }
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested impression to @impression" do
      impression = create(:impression)
      get :edit, params: { id: impression, book_id: impression.book_id}
      expect(assigns(:impression)).to eq impression
    end
    it "renders the :edit template" do
      impression = create(:impression)
      get :edit, params: { id: impression, book_id: impression.book_id}
      expect(assigns(:impression)).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "assigns the requested impression to @impression" do
      impression = create(:impression)
      get :show, params: { id: impression, book_id: impression.book_id}
      expect(assigns(:impression)).to eq impression
    end
    it "renders the :show template" do
      impression = create(:impression)
      get :show, params: { id: impression, book_id: impression.book_id}
      expect(assigns(:impression)).to render_template :show
    end
  end

  describe 'GET #index' do
    it "populates an array of impression ordered by created_at DESC" do
      book = create(:book)
      impressions = create_list(:impression, 10, book_id: book.id) 
      get :index, params: { book_id: book.id }
      expect(assigns(:impressions)).to match(impressions.sort{ |a, b| b.created_at <=> a.created_at })
    end
    it "renders the :index template" do
      book = create(:book)
      impressions = create_list(:impression, 10, book_id: book.id) 
      get :index, params: { book_id: book.id }
      expect(response).to render_template :index
    end
  end  
end