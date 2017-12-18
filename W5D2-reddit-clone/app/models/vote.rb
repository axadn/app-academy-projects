class Vote < ApplicationRecord
   validates :votable_id, :user, :value, presence: true
   validates :votable_id, uniqueness: {scope: :user}
   validates :value , inclusion: {in: [-1,1]}

  belongs_to :votable, polymorphic: true
 belongs_to :user
end
