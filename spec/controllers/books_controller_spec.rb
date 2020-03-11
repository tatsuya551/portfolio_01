require 'rails_helper'

describe BooksController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested book to @book" do
      book = create(:book)
      get :edit, params: { id: book }
      expect(assigns(:book)).to eq book
    end
    it "renders the :edit template" do
      book = create(:book)
      get :edit, params: { id: book }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "assigns the requested book to @book" do
      book = create(:book)
      get :show, params: { id: book }
      expect(assigns(:book)).to eq book
    end
    it "renders the :show template" do
      book = create(:book)
      get :show, params: { id: book }
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it "populates an array of book ordered by created_at DESC" do
      user = create(:user)
      books = create_list(:book, 3, user: user) 
      get :index
      expect(assigns(:books)).to match(books.sort{ |a, b| b.created_at <=> a.created_at })
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #follow_book_show' do
    it "assigns the requested book to @book" do
      book = create(:book)
      get :follow_book_show, params: { id: book }
      expect(assigns(:book)).to eq book
    end
    it "renders the :follow_book_show template" do
      book = create(:book)
      get :follow_book_show, params: { id: book }
      expect(response).to render_template :follow_book_show
    end
  end
end