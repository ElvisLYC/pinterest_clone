class WelcomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    @posts = Post.all
    if params[:post][:term]
      @posts = @posts.search_by_posts(params[:post][:term])
    else
      @Posts = @posts
    end
  end
end
