source 'https://rubygems.org'

ruby '2.7.8'
gem 'rails', '~>5.2'
gem 'pg', '~>1.5.9' # latest for Postgres >= 10
gem 'jquery-rails'
gem 'coffee-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'slim-rails'
gem 'turbolinks'
gem 'devise'
gem 'activeadmin', '~>2.9.0' # 2.10 drops support for Rails 5.2
gem 'active_record-acts_as'
gem 'mandrill-api'
gem 'formtastic', '~> 3.1.5' # 4.0 drops support for Rails 5.2 (4 -> Rails 6, 5 -> Rails 7)
gem 'formtastic-bootstrap'
gem "cocoon"
gem 'bugsnag'
gem 'prawn'
gem 'delayed_job_active_record', '4.1.4' # this seems unused
gem 'rubyzip'
gem 'restforce'
gem 'newrelic_rpm'
gem 'render_async'
gem 'bundle-audit'
gem "rails-html-sanitizer"

group :production do
  gem 'unicorn'
  gem 'rails_serve_static_assets'
end

group :development do
  gem 'rack-mini-profiler'
  gem 'thin'
  gem 'guard-rspec', require: false
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "bullet"
  gem 'dotenv-rails', '~>2.2.2' # we should be able to go to ~>2.2. 3 -> Rails 6+
  gem 'pry'
  gem 'rspec-rails', '~> 3.7' # 5 drops support for Rails 5, 6 -> Rails 6.1 -> 7.0, 6.1 -> 7.1, 7 -> 7.2, 8 -> 8
  gem "factory_bot_rails", require: false
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'shoulda-callback-matchers'
  gem 'rake'
  gem 'dotenv-deployment'
  gem 'simplecov', require: false, group: :test
  gem 'webmock'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end
