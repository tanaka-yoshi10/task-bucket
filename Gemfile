source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.0'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem "doorkeeper", "~> 5.1"
gem 'font-awesome-sass'
gem 'hamlit-rails'
gem 'jb'
gem 'kaminari'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'ransack'
gem 'sassc-rails'
gem 'simple_form'
gem 'uglifier'
gem 'webpacker'

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'foreman'
  gem 'rspec-rails'
end

group :development do
  gem 'js_rails_routes'
  gem 'letter_opener_web'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'webdrivers'
end
