class User < ApplicationRecord
  validates :username,
    presence: true, uniqueness: true

  has_many :artwork_shares,
  primary_key: :id,
  foreign_key: :viewer_id,
  dependent: :destroy

  has_many :shared_artworks,
  through: :artwork_shares,
  source: :artwork

  has_many :artworks,
  primary_key: :id,
  foreign_key: :artist_id,
  dependent: :destroy

  def shared_and_owned_artworks
    Artwork
    .select("DISTINCT artworks.*")
    .joins(:shared_viewers)
    .joins(:artist)
    .where("users.id = ? OR artists_artworks.id = ?", self.id, self.id)

  end
end
