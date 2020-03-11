require 'rails_helper'

describe SignupController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #logout' do
    it "renders the :logout template" do
      get :logout
      expect(response).to render_template :logout
    end
  end

  describe 'GET #start_app' do
    it "renders the :start_app template" do
      get :start_app
      expect(response).to render_template :start_app
    end
  end
end