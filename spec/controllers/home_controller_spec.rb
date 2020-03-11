require 'rails_helper'

describe HomeController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #app_description' do
    it "renders the :app_description template" do
      get :app_description
      expect(response).to render_template :app_description
    end
  end
end