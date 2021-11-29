source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

### core
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false


### data
gem 'pg', '~> 1.1'

### js
gem 'jbuilder', '~> 2.7'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 5.0'


group :development do
  gem 'active_record_query_trace'
  # gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console', '>= 4.1.0'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  # gem 'rails_apps_pages', github: 'RailsApps/rails_apps_pages' # requires high_voltage
end

group :development, :test do
#   gem 'awesome_print', :require => 'ap'
  gem 'bullet'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'           # rails console to open pry
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'rspec-rails', '~> 3.7'
end

group :test do
  # gem 'chromedriver-helper'
  # gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'faker'
  # gem 'selenium-webdriver'
  # gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'stripe-ruby-mock'
  gem 'webmock'
  gem 'rails-controller-testing'
end

