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
      redirect_to post_path(@post.id)
    else
      render new_post_path
    end
  end

  def search
    @posts = Post.all
    if params[:query]
      @posts = @posts.search_by_posts(params[:query])
      # render :json => { posts: @posts }
      # respond_to do |format|
      #   format.json { render json: @posts }
      #   format.js # remote: true is sent a js format and sends you to search.js.erb
      # end
    else
      @posts = @posts
    end
  end

  def ajax_search
    @posts = Post.all
    @posts = Post.search_by_posts(params["query"]).pluck(:caption).uniq
    respond_to do |format|
      format.json { render json: @posts }
      format.js # remote: true is sent a js format and sends you to search.js.erb
    end
  end

  def show
    # @posts = Post.all
    # if params[:post][:term]
    #   @posts = @posts.search_by_posts(params[:post][:term])
    # else
    #   @Posts = @posts
    # end
    @post = Post.find(params[:id])
    @vote = Vote.new
    @current_vote = Vote.where(user_id: current_user.id, post_id: params[:id])
    @votes = Vote.where(post_id: params[:id])
  end

  # def unvote
  #   byebug
  #   @post = Post.find(params[:id])
  #   @vote = Vote.new
  #   @current_vote = Vote.where(user_id: current_user.id, post_id: params[:id])
  #   @votes = Vote.all
  #
  #   if @current_vote.any? == true
  #     byebug
  #     @current_vote.destroy
  #     redirect post_path
  #   else
  #     redirect post_path
  #   end
  # end

  def random
  end

  private
  def post_params
    params.require(:post).permit(:caption, :user_id, :photo)
  end

end
