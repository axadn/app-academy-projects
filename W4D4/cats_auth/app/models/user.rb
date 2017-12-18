class User < ApplicationRecord
    attr_reader :password
    has_many :cats, primary_key: :id, foreign_key: :owner_id, class_name: :Cat
    has_many :cat_rental_requests
    has_many :sessions

    validates :user_name, :password_digest, presence: true, uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true
    # after_initialize :ensure_session_token

    def self.find_by_credentials(user_name, password)
      user = User.find_by(user_name: user_name)
      return user if user && user.is_password?(password)
      nil
    end

    def password=(pw)
      @password = pw
      self.password_digest = BCrypt::Password.create(pw)
    end

    def generate_session_token
      SecureRandom.urlsafe_base64(16)
    end

    def is_password?(password)
       BCrypt::Password.new(self.password_digest).is_password?(password)
    end


end
