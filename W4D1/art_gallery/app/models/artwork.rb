class Artwork <ActiveRecord::Base
  validates :title, uniqueness: {scope: :artist_id},
  presence:true

  validates :artist_id, presence: true
  validates :image_url, presence: true

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  primary_key: :id,
  foreign_key: :artwork_id

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer
end
