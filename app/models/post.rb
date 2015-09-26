class Post < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true
	validates :title, presence:   true
  validate  :picture_size

  has_many :comments, dependent: :destroy
  
  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
		end
  
end
