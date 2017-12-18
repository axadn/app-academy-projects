module VotableController
  def upvote
    vote(1)
  end
  def downvote
    vote(-1)
  end
end
