class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.published.includes(:group).order("id DESC").page(params[:page])
    set_meta_tags title: '文章列表', description: "提供rails文章和视频教程，知识和信息交流", keywords: ActsAsTaggableOn::Tag.most_used.map(&:name).join(", ")
  end

  def show
    set_meta_tags title: @article.title, description: @article.title, keywords: @article.tag_list
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

end
