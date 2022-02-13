source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 7.0.1"

# The traditional bundling and transpiling asset pipeline for Rails.
gem "sprockets-rails", ">= 2.0.0"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.3"

# Use Puma as the app server
gem "puma", "~> 5.6"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", ">= 1.0.0"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", ">= 1.0.0"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", ">= 1.0.0"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", ">= 1.0.0"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.6"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Use Active Storage variant
gem "image_processing", ">= 1.2"

gem "strong_migrations"
gem "sidekiq"

group :development, :test do
  # Start debugger with binding.b [https://github.com/ruby/debug]
  gem "debug", ">= 1.0.0", platforms: %i[mri mingw x64_mingw]
  gem "pry-rails"
  gem "annotate"
  gem "brakeman"
  gem "bundler-audit", github: "rubysec/bundler-audit"
  gem "letter_opener_web", "~> 2.0"
  gem "standard"

  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers", require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem 'rack-mini-profiler', '~> 2.0'
end
