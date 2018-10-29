class Vote < ApplicationRecord
  # validates :vote, :uniqueness => true
  belongs_to :post
  belongs_to :user
end
