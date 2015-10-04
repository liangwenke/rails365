class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    if params[:search].present?
      @articles = Article.published.select("ts_headline('testzhcfg', title, plainto_tsquery('testzhcfg', '#{params[:search]}'), 'StartSel=<span>, StopSel=</span>') AS title, created_at, published, group_id, slug, id").search_by_title_or_body(params[:search]).order("id DESC").page(params[:page])
    else
      @articles = Article.published.select(:title, :created_at, :published, :group_id, :slug, :id).includes(:group).order("id DESC").page(params[:page])
    end
    set_meta_tags title: '文章列表', description: "提供rails文章和视频教程，知识和信息交流", keywords: ActsAsTaggableOn::Tag.most_used.map(&:name).join(", ")
  end

  def show
    set_meta_tags title: @article.title, description: @article.title, keywords: @article.tag_list
    @group_name = @article.group.try(:name) || ""
    @recommend_articles = Article.published.select("ts_headline('testzhcfg', title, plainto_tsquery('testzhcfg', '#{@group_name}'), 'StartSel=<span>, StopSel=</span>') AS title, created_at, published, group_id, slug, id").search_by_title_or_body(@group_name).order("visit_count DESC").limit(10)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

end
