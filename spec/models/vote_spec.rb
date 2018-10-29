require 'rails_helper'

RSpec.describe Vote, type: :model do
  # happy path
  it "votes increase on every vote count" do
  @user = User.create(email: "abc@gmail.com", name: "abc", password: "1234", password_confirmation: "1234")
  @post = Post.create(caption: "Hello", user_id: @user.id)
  @vote = Vote.new(vote: 1, user_id: @user.id, post_id: @post.id)
  @vote.save
  expect(@vote.post.total_votes).to eq(1)
  end
  #unhappy path
  # it "if search by invalid term for caption" do
  #
  # end

end
