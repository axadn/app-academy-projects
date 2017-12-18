class Post < ApplicationRecord
  has_many :votes, as: :votable
  validates :title, presence: true
  validates :subs, presence: true

  has_many :post_subs
  has_many :subs,
    through: :post_subs,
    source: :sub
  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User
  has_many :comments

  def comments_by_parent_id
    hash = Hash.new {|h, k| h[k] =[]}
    comments.includes(:author).each do |comment|
      hash[comment.parent_id] << comment
    end
    hash
  end

  def top_level_comments
    comments.where(parent_id: nil).includes(:author)
  end
  def vote_count
    votes.inject(0){|accum, vote| accum + vote.value}
  end
end
