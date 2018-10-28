class Post < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :votes, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  pg_search_scope :search_by_posts,
                :against => [:caption],
                :using => {
                  :tsearch => {:prefix => true}
                }
pg_search_scope :search_by_title, :against => :title

end
