require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "#new" do
    it "should render the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    context 'with invalid params' do
      before(:each) do
          User.create(username: "Laura", password: "12341442123")
        post :create, params: {user: {username: "Laura", password: "23"}}
      end
      it 'should render the new template' do
        expect(response).to render_template(:new)
      end
      it 'should display some errors' do
        expect(flash[:errors]).to be_present
      end
    end
    context 'with valid params'do
      before(:each) do
        User.create(username: "Laura", password: "12341442123")
        post :create, params: {user: {username: "Laura", password: "12341442123"}}
      end
      it 'should login the user' do
        expect(session[:session_token]).to eq(User.last.session_token)
      end
      it 'should redirect to the user show page' do
        expect(response).to redirect_to(user_url(User.last))
      end
    end
  end
end
