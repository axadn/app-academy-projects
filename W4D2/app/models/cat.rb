# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'

class Cat < ApplicationRecord
  COLORS = [ 'orange', 'black', 'white', 'gray' ]
  validates :color, inclusion: { in: COLORS, message: "Color is not valid"}
  validates :sex, inclusion: { in: %w(M F), message: "Sex is not valid"}

  def age
    ((Date.today - self.birth_date).to_i)/365
  end

  has_many :requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
