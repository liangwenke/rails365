class Admin::BaseController < ActionController::Base
  USERS = { ENV["USERNAME"] => ENV['PASSWORD'] }
  layout "admin"

  before_action :authenticate
  before_action :authorize

  private
    def authenticate
      authenticate_or_request_with_http_digest do |username|
        session[:admin] = true
        USERS[username]
      end
    end

    def authorize
      if session[:admin]
        Rack::MiniProfiler.authorize_request
      end
    end
end
