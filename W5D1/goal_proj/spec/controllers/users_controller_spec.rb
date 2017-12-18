require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'should render the "new" template' do
      get :new
      expect(response).to render_template("new")
    end
  end
  describe '#create' do
    context 'with valid params'do
      before(:each) do
        post :create, params: {user: {username: "Laura", password: "croft123"}}
      end
      it 'should redirect to the user show page' do
        expect(response).to redirect_to(user_url(User.last))
      end
      it 'should log in the user' do
        expect(session[:session_token]).to eq(User.last.session_token)
      end
    end
    context 'with invalid params' do
      before(:each) do
        post :create, params: {user: {username: "L", password: "a"}}
      end
      it 'should render the new template' do
        expect(response).to render_template('new')
      end
      it 'should set some errors' do
        expect(flash[:errors]).to be_present
      end
    end
  end
#
  describe '#show' do
    subject(:laura) do
      post :create, params: {user: {username: "Laura", password: "croft123"}}
      User.last
    end
    it 'should render the show template' do

      get :show, params: {id: laura.id}
      expect(response).to render_template('show')
    end

    context 'on the user\'s own page' do
      it 'should render all goals whether public or private'
    end

    context 'on another user\'s page' do
      it 'should only render the public goals'
    end
  end
end
