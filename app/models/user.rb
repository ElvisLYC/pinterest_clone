class User < ApplicationRecord
  validates :email, :format => { :with => /\w+[@]\w+[.]\w{1}\w+/}, uniqueness: true
  validates :name, :format => { :with => /\w+[^ ]/}, uniqueness: true
  has_secure_password
end
