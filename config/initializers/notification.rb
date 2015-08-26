ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, started, finished, unique_id, payload|
  Rails.logger.info payload
  if payload[:controller] == "ArticlesController" && payload[:action] == "show"
    UpdateArticleVisitCountWorker.perform_async(payload[:params]["id"]) if payload[:params]["id"].present?
  end
end
