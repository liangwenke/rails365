class Article < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  validates :title, :body, presence: true
end
