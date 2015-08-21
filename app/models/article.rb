class Article < ActiveRecord::Base
  scope :published, -> { where(published: true) }
end
