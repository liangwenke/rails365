class HomeController < ApplicationController
  def index
    @articles = Article.except_body_with_default.order("id DESC").limit(10)
    @hot_articles = Article.except_body_with_default.select("visit_count").order("visit_count DESC").limit(10)
    @groups = Group.all
  end
end
