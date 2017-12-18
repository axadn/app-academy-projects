class CommentsController < ApplicationController
  include VotableController
  before_action :ensure_logged_in
  def new
    @comment = Comment.new
    render :new
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(comment_params[:post_id])
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(comment_params[:post_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_id)
  end
  def vote(val)
    previous_vote = Vote.find_by(user: current_user, votable_id:
    params[:id])
    if previous_vote
      if previous_vote.value == val * -1
        previous_vote.destroy
        redirect_back(fallback_location: subs_url)
      end
    else
      vote = Vote.new(user: current_user, value: val,
       votable: Comment.find_by(id: params[:id]))
       vote.save
       redirect_back(fallback_location: subs_url)
    end
  end
end
