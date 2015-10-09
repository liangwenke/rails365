class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order("taggings_count DESC")
  end
end
