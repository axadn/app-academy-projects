class User < ApplicationRecord
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :password_digest, :username, :session_token, presence: true, uniqueness: true
  after_initialize :ensure_session_token
  attr_accessor :password

  def password=(new_pass)
    @password = new_pass
    self.password_digest = BCrypt::Password.create(new_pass)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end
  def self.find_by_credentials(params)
    user = User.find_by(username: params[:username])
    return user if user && user.is_password?(params[:password])
    nil
  end
end
