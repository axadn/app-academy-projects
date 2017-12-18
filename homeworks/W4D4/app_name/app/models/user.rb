require 'bcrypt'
class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest,
    presence: {message: "password can't be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password
  def self.find_by_credentials(username, password)
    user = find_by(username: username)
    if user && BCrypt::Password.new(user.password_digest).is_password?(password)
      user
    end
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

end
