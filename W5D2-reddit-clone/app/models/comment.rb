class Comment < ApplicationRecord
  has_many :votes, as: :votable
  belongs_to :post
  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  belongs_to :parent,
    primary_key: :id,
    foreign_key: :parent_id,
    class_name: :Comment,
    optional: true
    has_many :child_comments,
    primary_key: :id,
    foreign_key: :parent_id,
    class_name: :Comment
  validates :author, :post, :content, presence: true
  def vote_count
    votes.inject(0){|accum, vote| accum + vote.value}
  end
end
