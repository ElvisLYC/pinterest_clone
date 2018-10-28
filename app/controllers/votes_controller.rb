class VotesController < ApplicationController
  def index
  end

  def destroy
    @vote = Vote.where(user_id: current_user.id, post_id: params[:id])
    if @vote != nil
      @vote.destroy
      render post_path
    else
      render post_path
    end
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    @vote.post_id = Post.find(params[:id]).id
    @vote.vote = 1
    if @vote.save
      redirect_to post_path
    else
      redirect_to post_path
    end
  end

  def destroy
    @current_vote = Vote.where(user_id: current_user.id, post_id: params[:id])
    if @current_vote.any? == true
      @current_vote.destroy
      redirect post_path
    else
      redirect post_path
    end
  end
  private
  def vote_params
    params.permit(:vote, :user_id, :post_id)
  end
end
