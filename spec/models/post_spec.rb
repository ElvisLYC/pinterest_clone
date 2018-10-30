require 'rails_helper'

RSpec.describe Post, type: :model do

  it "if search by valid term for caption" do
    @user = User.create(email: "abc@gmail.com", name: "abc", password: "1234", password_confirmation: "1234")
    #@photo will stimulate file upload to the post
    @photo = File.new(Rails.root + "app/assets/images/santorini_1.jpg")
    @post = Post.create(caption: "Hello", user_id: @user.id, photo: @photo)
    @result = Post.search_by_posts("Hello")
    expect(@result.first.caption).to eq("Hello")
  end
  it "if search by invalid term (and no photo) for caption" do
    @user = User.create(email: "abc@gmail.com", name: "abc", password: "1234", password_confirmation: "1234")
    #@photo will stimulate file upload to the post
    @photo = File.new(Rails.root + "app/assets/images/santorini_1.jpg")
    @post = Post.create(caption: "Hello", user_id: @user.id, photo: @photo)
    @result = Post.search_by_posts("qwertyui")
    expect(@result.any?).to eq(false)
  end
end
