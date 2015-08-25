require 'rack-mini-profiler'
# initialization is skipped so trigger it
Rack::MiniProfilerRails.initialize!(Rails.application)

# set RedisStore
# Rack::MiniProfiler.config.storage_options = { :host => '127.0.0.1', :port => 6379 }
# Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
