require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:jack) {User.create!(username: "Jack", password: 'abcdef')}
  let(:sally) {User.create!(username: "Sally", password: 'abcdef')}
  describe "GET #new" do
    context "when logged in" do
      before do
        allow(controller).to receive(:ensure_logged_in) {}
        allow(controller).to receive(:current_user) {jack}
        allow(controller).to receive(:logged_in?) {true}
      end
      it "should render the new template" do
        get :new
        expect(response).to render_template('new')
      end
    end
  end
  describe "POST #create" do

    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) {jack}
      allow(controller).to receive(:logged_in?) {true}
      end
      context "when the user_id is the current user's" do
        context "with valid params" do
          it "should redirect to the users show page" do
            post :create, params: {user_id: jack.id,
              goal: {body: "do 50 pushups"}}
            expect(response).to redirect_to(user_url(Goal.last.user_id))
          end
        end
        context "with invalid params" do
          before(:each) do
            post :create, params: {user_id: 37,
            goal: {body: nil}}
          end
          it "should render the new template" do
            expect(response).to render_template('new')
          end
          it "should set some errors" do
            expect(flash[:errors]).to be_present
          end
        end
      end
      context "when the user id does not match the current user's" do
        it "should not create the goal"
      end
    end

    context "when logged out" do
      it "should not create the goal"
      it "should redirect to the login page"
    end

  end
  describe "GET #edit" do
    context "if it is owned by the current user" do
      it "should render the edit template"
    end
    context "if it is owned by a different user" do
      it "should not render the edit template"
    end
    context "if the user is logged out" do
      it "should redirect to the ogin page"
    end
  end
  describe "PATCH #update" do
    context "when owned by the current user" do
      context "with valid params" do
        it "should render the users show page"
      end

      context "with invalid params" do
        it "shoud render the edit template"
        it "should set some errors"
      end
    end

    context "when it is not owned by the current user" do
      it "should not update the goal"
    end
    context "when logged out " do
      it "should not update the goal"
      it "should redirect to the login page"
    end
  end
  describe "DELETE #destroy" do
    context "when it is owned by the current user" do
      it "should destroy the goal"
    end
    context "when it is not owned by the current user" do
      it "should not destroy the goal"
    end
    context "when logged out" do
      it "should redirect to the login page"
    end
  end
  describe "GET #show" do
    it "should render the show template"
  end
end
