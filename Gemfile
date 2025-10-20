source "https://rubygems.org"

ruby "3.0.7"
gem "rails", "~>7.0.1"
gem "concurrent-ruby", "1.3.4" # pinning during upgrade until Rails 7.1 https://stackoverflow.com/a/79361034
gem "pg", "~>1.5.9" # latest for Postgres >= 10
gem "jquery-rails"
gem "sass-rails" # only used by activeadmin and no longer required upstream
gem "ffi", "~>1.16.0" # pinning during upgrade until we can drop sassc or upgrade to latest ruby
gem "uglifier"
gem "slim-rails"
gem "turbolinks"
gem "devise"
gem "activeadmin"
gem "active_record-acts_as"
gem "MailchimpTransactional"
gem "formtastic"
gem "cocoon"
gem "bugsnag"
gem "prawn"
gem "delayed_job_active_record"
gem "rubyzip"
gem "restforce"
gem "newrelic_rpm"
gem "render_async"
gem "bundle-audit"
gem "rails-html-sanitizer"

group :production do
  gem "unicorn"
  gem "rails_serve_static_assets"
end

group :development do
  gem "rack-mini-profiler"
  gem "thin"
  gem "guard-rspec", require: false
  gem "spring", "4.2.1" # pinning during upgrade until Rails 7.0.1 https://github.com/rails/spring/issues/734
  gem "spring-commands-rspec"
  gem "standard"
end

group :development, :test do
  gem "bullet"
  gem "dotenv-rails"
  gem "pry"
  gem "rspec-rails"
  gem "factory_bot_rails", require: false
end

group :test do
  gem "shoulda-matchers", require: false
  gem "shoulda-callback-matchers"
  gem "rake"
  gem "dotenv-deployment"
  gem "simplecov", require: false, group: :test
  gem "webmock"
  gem "database_cleaner"
  gem "rails-controller-testing"
end
