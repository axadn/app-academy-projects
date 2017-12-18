class GoalsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_correct_user

 def edit
   render :edit
 end

 def new
   render :new
 end

 def create
   @goal = Goal.new(goals_params)
   @goal.user_id = params[:user_id]
   if @goal.save
     render user_url(params[:user_id])
   else
     flash.now[:errors] = @goal.error.full_messages
     render :new
   end
 end
 def goals_params
   params.require(:goal).permit(:body, :public, :completed)
 end

end
