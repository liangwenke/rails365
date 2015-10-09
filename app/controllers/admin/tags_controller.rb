class Admin::TagsController < Admin::BaseController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end
end
