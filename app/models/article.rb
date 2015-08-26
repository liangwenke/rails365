class Article < ActiveRecord::Base
  acts_as_taggable
  belongs_to :group, counter_cache: true
  scope :published, -> { where(published: true) }
  validates :title, :body, presence: true
end
