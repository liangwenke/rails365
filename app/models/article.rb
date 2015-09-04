require "babosa"
class Article < ActiveRecord::Base
  acts_as_taggable
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :group, counter_cache: true
  scope :published, -> { where(published: true) }
  validates :title, :body, presence: true
  validates :title, uniqueness: true

  def normalize_friendly_id(input)
    PinYin.of_string(input).to_s.to_slug.normalize.to_s
  end
end
