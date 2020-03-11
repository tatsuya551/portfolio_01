require 'rails_helper'

describe UsersController do
  describe 'GET #edit' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :edit template" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :show template" do
      user = create(:user)
      get :show, params: { id: user }
      expect(response).to render_template :show
    end
  end

  describe 'GET #category' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :category, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :category template" do
      user = create(:user)
      get :category, params: { id: user }
      expect(response).to render_template :category
    end
  end

  describe 'GET #novel' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :novel, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :novel template" do
      user = create(:user)
      get :novel, params: { id: user }
      expect(response).to render_template :novel
    end
  end

  describe 'GET #management' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :management, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :management template" do
      user = create(:user)
      get :management, params: { id: user }
      expect(response).to render_template :management
    end
  end

  describe 'GET #economy' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :economy, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :economy template" do
      user = create(:user)
      get :economy, params: { id: user }
      expect(response).to render_template :economy
    end
  end

  describe 'GET #finance' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :finance, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :finance template" do
      user = create(:user)
      get :finance, params: { id: user }
      expect(response).to render_template :finance
    end
  end

  describe 'GET #it' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :it, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :it template" do
      user = create(:user)
      get :it, params: { id: user }
      expect(response).to render_template :it
    end
  end

  describe 'GET #motivation' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :motivation, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :motivation template" do
      user = create(:user)
      get :motivation, params: { id: user }
      expect(response).to render_template :motivation
    end
  end

  describe 'GET #talent' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :talent, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :talent template" do
      user = create(:user)
      get :talent, params: { id: user }
      expect(response).to render_template :talent
    end
  end

  describe 'GET #etc' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :etc, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :etc template" do
      user = create(:user)
      get :etc, params: { id: user }
      expect(response).to render_template :etc
    end
  end

  describe 'GET #reread_timing' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :reread_timing, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :reread_timing template" do
      user = create(:user)
      get :reread_timing, params: { id: user }
      expect(response).to render_template :reread_timing
    end
  end




  describe 'GET #reread_timing' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :reread_timing, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :reread_timing template" do
      user = create(:user)
      get :reread_timing, params: { id: user }
      expect(response).to render_template :reread_timing
    end
  end

  describe 'GET #timing_motivation' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :timing_motivation, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :timing_motivation template" do
      user = create(:user)
      get :timing_motivation, params: { id: user }
      expect(response).to render_template :timing_motivation
    end
  end

  describe 'GET #timing_decision' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :timing_decision, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :timing_decision template" do
      user = create(:user)
      get :timing_decision, params: { id: user }
      expect(response).to render_template :timing_decision
    end
  end

  describe 'GET #timing_stress' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :timing_stress, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :timing_stress template" do
      user = create(:user)
      get :timing_stress, params: { id: user }
      expect(response).to render_template :timing_stress
    end
  end

  describe 'GET #timing_feel_down' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :timing_feel_down, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :timing_feel_down template" do
      user = create(:user)
      get :timing_feel_down, params: { id: user }
      expect(response).to render_template :timing_feel_down
    end
  end

  describe 'GET #timing_lost_love' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :timing_lost_love, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :timing_lost_love template" do
      user = create(:user)
      get :timing_lost_love, params: { id: user }
      expect(response).to render_template :timing_lost_love
    end
  end

  describe 'GET #timing_diversion' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :timing_diversion, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :timing_diversion template" do
      user = create(:user)
      get :timing_diversion, params: { id: user }
      expect(response).to render_template :timing_diversion
    end
  end

  describe 'GET #timing_relax' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :timing_relax, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :timing_relax template" do
      user = create(:user)
      get :timing_relax, params: { id: user }
      expect(response).to render_template :timing_relax
    end
  end

  describe 'GET #all_books' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :all_books, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :all_books template" do
      user = create(:user)
      get :all_books, params: { id: user }
      expect(response).to render_template :all_books
    end
  end

  describe 'GET #read_books' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :read_books, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :read_books template" do
      user = create(:user)
      get :read_books, params: { id: user }
      expect(response).to render_template :read_books
    end
  end

  describe 'GET #will_read_books' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :will_read_books, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :will_read_books template" do
      user = create(:user)
      get :will_read_books, params: { id: user }
      expect(response).to render_template :will_read_books
    end
  end

  describe 'GET #follow_book' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :follow_book, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :follow_book template" do
      user = create(:user)
      get :follow_book, params: { id: user }
      expect(response).to render_template :follow_book
    end
  end

  describe 'GET #followings' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :followings, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :followings template" do
      user = create(:user)
      get :followings, params: { id: user }
      expect(response).to render_template :followings
    end
  end

  describe 'GET #followers' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :followers, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :followers template" do
      user = create(:user)
      get :followers, params: { id: user }
      expect(response).to render_template :followers
    end
  end

  describe 'GET #read_count_books' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :read_count_books, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :read_count_books template" do
      user = create(:user)
      get :read_count_books, params: { id: user }
      expect(response).to render_template :read_count_books
    end
  end

  describe 'GET #read_history' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :read_history, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "renders the :read_history template" do
      user = create(:user)
      get :read_history, params: { id: user }
      expect(response).to render_template :read_history
    end
  end

end