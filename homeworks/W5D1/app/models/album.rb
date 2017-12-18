# == Schema Information
#
# Table name: albums
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  band_id :integer          not null
#  year    :integer          not null
#  live    :boolean          default(FALSE), not null
#

class Album < ApplicationRecord
  has_many :tracks, dependent: :destroy
  validates :title, :band_id, :year, presence: true
  belongs_to :band
end
