class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      user.compute_posts
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
end

def user_params
  params.require(:user).permit(:name, :email, :password, :total_post, :password_confirmation)
end
