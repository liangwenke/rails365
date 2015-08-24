class Article < ActiveRecord::Base
  belongs_to :group
  scope :published, -> { where(published: true) }
  validates :title, :body, presence: true
end
