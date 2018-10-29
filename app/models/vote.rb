class Vote < ApplicationRecord
  # validates :vote, :uniqueness => true
  belongs_to :post
  belongs_to :user

after_create :compute_total_votes

  def compute_total_votes
    total_votes = Vote.where(post_id: self.post_id).length
    self.post.update(total_votes: total_votes)
    self.post.save
  end
end
