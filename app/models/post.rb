class Post < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :votes, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :photo, :presence => true
  pg_search_scope :search_by_posts,
                  :against => [:caption],
                  :using => {
                  :tsearch => {:prefix => true}
                }
  # pg_search_scope :search_by_title, :against => :title
  # after_create :compute_total_posts
  #
  # def compute_total_posts
  #   self.user.compute_posts
  #   self.user.save
  #   self.save
  # end

end
