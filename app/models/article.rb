class Article < ActiveRecord::Base
  belongs_to :group, counter_cache: true
  scope :published, -> { where(published: true) }
  validates :title, :body, presence: true
end
