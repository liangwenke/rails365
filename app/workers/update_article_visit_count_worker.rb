class UpdateArticleVisitCountWorker
  include Sidekiq::Worker
  def perform(article_id)
    logger.info 'update article visit count begin'
    @article = Article.find(article_id)
    @article.visit_count += 1
    @article.save!(validate: false)
    logger.info 'update article visit count end'
  end
end
