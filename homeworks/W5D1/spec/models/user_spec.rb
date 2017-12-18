require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }

  subject(:laura) {User.create(email: "Laura", password: "croft123")}
  describe "#is_password?" do

    it "returns false if the password is incorrect" do
      expect(laura.is_password?("croft124")).to be_falsey
    end
    it "returns true if the password is correct" do
      expect(laura.is_password?("croft123")).to be_truthy
    end
  end
  describe "#reset_session_token" do
    before(:each) do
      @old_token = laura.session_token
      laura.reset_session_token!
    end
    it "should change the users session token" do
      expect(laura.session_token).to_not eq(@old_token)
    end
    it "should save the new token to the database" do
      expect(User.find_by(email: "Laura").session_token).to_not eq(@old_token)
    end
  end

end
