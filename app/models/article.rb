require "babosa"
class Article < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_title_or_body,
                  :against => {
                    :title => 'A',
                    :body => 'B'
                  },
                  :associated_against => {
                    :tags => [:name],
                  },
                  :using => {
                    :tsearch => {:dictionary => "testzhcfg", :prefix => true, :negation => true}
                  }
  acts_as_taggable
  ActsAsTaggableOn.remove_unused_tags = true
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  belongs_to :group, counter_cache: true
  scope :published, -> { where(published: true) }
  scope :except_body_with_default, -> { published.select(:title, :created_at, :published, :group_id, :slug, :id).includes(:group) }
  validates :title, :body, presence: true
  validates :title, uniqueness: true

  def normalize_friendly_id(input)
    date = if self.created_at.present?
             created_at.strftime('%Y-%m-%d')
           else
             Time.zone.now.strftime('%Y-%m-%d')
           end
    "#{date}-#{PinYin.of_string(input).to_s.to_slug.normalize.to_s}"
  end

  def set_friendly_id
    self.slug = "#{created_at.strftime('%Y-%m-%d')}-#{self.slug}"
  end

  def should_generate_new_friendly_id?
    title_changed? || super
  end

  alias_method :old_tag_list, :tag_list
  def tag_list
    super.join(", ")
  end

end
