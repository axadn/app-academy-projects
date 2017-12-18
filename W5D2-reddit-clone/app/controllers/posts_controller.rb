class PostsController < ApplicationController
  include VotableController
  before_action :ensure_logged_in,only: [:edit, :create, :new,  :update, :destroy]
  before_action :ensure_correct_user,
     only: [:edit, :new,  :update, :destroy]
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(params[:sub_id])
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def new
    @post = Post.new
    @post.sub_ids = [params[:sub_id]]
    render :new
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    redirect_to post_url(@post) unless @post.author == current_user
  end
  def edit
    render :edit
  end

  def destroy
    @post.destroy
  end

  def update
    @post.assign_attributes(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
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
       votable: Post.find_by(id: params[:id]))
       vote.save
       redirect_back(fallback_location: subs_url)
    end
  end
end
