source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
gem 'bootstrap-sass', '3.3.0.0'
gem "font-awesome-rails"

gem 'mysql2', '~> 0.3.18'
gem 'simple_form'
gem 'country_select'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'devise'

gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'gon'

gem "paperclip", "~> 5.0.0.beta1"

group :development, :test, :production do
  gem 'thin'
end



# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'#, '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
	gem 'better_errors'
	gem 'binding_of_caller'
	gem 'capistrano'#, '~> 3.0.1'
	gem 'capistrano-bundler'
	gem 'capistrano-rails', '~> 1.1.0'
	gem 'capistrano-rails-console'
	gem 'capistrano-rvm', '~> 0.1.1'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'capybara', '~> 2.5'
end

group :test do
  #gem 'shoulda-matchers'#, '~> 3.0.1'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', '~> 1.5'
  gem 'faker', '~> 1.6.1'
  gem 'selenium-webdriver'
  gem 'simplecov', :require => false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
