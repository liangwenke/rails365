class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    if params[:search].present?
      @articles = Article.except_body_with_default.search_by_title_or_body(params[:search]).order("id DESC").page(params[:page])
    elsif params[:tag_id] && @tag = ActsAsTaggableOn::Tag.find_by(id: params[:tag_id])
      @articles = Article.except_body_with_default.tagged_with(@tag.name).order("id DESC").page(params[:page])
    else
      @articles = Article.except_body_with_default.order("id DESC").page(params[:page])
    end
    set_meta_tags title: '文章列表', description: "提供rails文章和视频教程，知识和信息交流", keywords: ActsAsTaggableOn::Tag.most_used.map(&:name).join(", ")
  end

  def show
    set_meta_tags title: @article.title, description: @article.title, keywords: @article.tag_list
    @group_name = @article.group.try(:name) || ""
    @recommend_articles = Article.except_body_with_default.search_by_title_or_body(@group_name).order("visit_count DESC").limit(11)
    @tags = @article.tag_counts_on(:tags)
  end

  private
    def set_article
      @article = Article.find(params[:id])
      if request.path != article_path(@article)
        return redirect_to @article, :status => :moved_permanently
      end
    end

end
