require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}
#
  subject(:laura) {User.new(username: "Laura", password: "croft123")}

  describe "#is_password?" do
    it "should return true if the password is correct" do
      expect(laura.is_password?("croft123")).to be_truthy
    end
    it "should return false if the password is wrong" do
      expect(laura.is_password?("afasdfawg")).to be_falsey
    end
  end

  describe "password=" do
    it "should call BCrypt password create" do
      expect(BCrypt::Password).to receive(:create).twice
      laura.password ="afdasfa"
    end
    it "should verify that the password is corect length" do
      laura.password ="a"
      expect(laura.errors[:password]).not_to be_nil
    end
    it "should change the password digest" do
      digest = laura.password_digest
      laura.password = "adfasgadsgsad"
      expect(laura.password_digest).to_not eq(digest)
    end
  end
  describe "::find_by_credentials" do
    it "should return the user with the specified usermane an password" do
      laura.save
      user = User.find_by_credentials("Laura", "croft123" )
       expect(user).to eq(laura)
    end

    it "should return nil with a non-existent username" do
      expect(User.find_by_credentials("saura",
       "croft123" )).to be_nil
    end

    it "should return nil if the password is incorrect" do
      expect(User.find_by_credentials("laura",
       "croft143" )).to be_nil
    end

  end

  describe "reset_session_token!" do
    it "should change the users session token" do
      old_session_token = laura.session_token
      laura.reset_session_token!
      expect(old_session_token).to_not eq(laura.session_token)
    end
    it "should save the user to the database with new token" do
      old_session_token = laura.session_token
      laura.reset_session_token!
      laura = User.find_by(username: "Laura")
      expect(laura.session_token).to_not eq(old_session_token)
    end
  end

  describe "ensure session_token" do
    it "should ensure and initialized user has a session token" do
      expect(laura.session_token).to_not be_nil
    end
  end
end
