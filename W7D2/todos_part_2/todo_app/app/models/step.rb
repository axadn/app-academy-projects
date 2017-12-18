# == Schema Information
#
# Table name: steps
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :string           not null
#  todo_id    :integer          not null
#  done       :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Step < ApplicationRecord
  validates :body, :title, presence: true
  validates :done, inclusion: { in: [true, false] }

  belongs_to :todo
end
