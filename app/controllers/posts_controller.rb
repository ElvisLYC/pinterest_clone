class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @user = User.find(@post.user_id)
    if @post.save
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:caption, :user_id, :photo)
  end
end
