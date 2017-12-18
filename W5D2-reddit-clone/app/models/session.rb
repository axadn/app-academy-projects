class Session < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  after_initialize :ensure_token
  validates :token, presence: true, uniqueness: true

  def ensure_token
    self.token ||= generate_token
  end

  def generate_token
    SecureRandom.urlsafe_base64(16)
  end
end
