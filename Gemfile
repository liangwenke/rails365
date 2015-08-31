if ENV['RUBYTAOBAO']
  source 'http://ruby.taobao.org'
else
  source 'https://rubygems.org'
end

gem 'rails', '4.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'pg', '~> 0.16.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-sass', '~> 3.3.5'
gem 'slim-rails', '~> 3.0.1'

# markdown
gem 'redcarpet', '~> 3.3.2'
gem 'rouge', github: "stanhu/rouge"

# configuration
gem 'figaro', '~> 1.1.1'

# file upload
gem 'carrierwave', '~> 0.10.0'
gem "jquery-fileupload-rails", '~> 0.4.5'
gem 'carrierwave-aliyun', '~> 0.3.5'

# for deploy
gem 'mina', require: false
gem 'unicorn', '~> 4.9.0'
gem 'mina-unicorn', :require => false
gem 'mina-sidekiq', require: false

gem 'kaminari', '~> 0.16.3'
gem 'awesome_print', '~> 1.6.1'

# monitor
gem 'oneapm_rpm'
gem 'rack-mini-profiler', require: false

# background
gem 'sidekiq'

# notification
gem 'exception_notification', github: 'smartinez87/exception_notification'

# tag
gem 'acts-as-taggable-on', '~> 3.4'

gem 'rack-google-analytics'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'factory_girl_rails', '~> 4.5.0'
end

group :development do
  gem 'quiet_assets'
  gem 'pry'
end
