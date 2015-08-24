class Photo < ActiveRecord::Base
  belongs_to :article
  mount_uploader :image, PhotoUploader
  validates :article, presence: true
end
