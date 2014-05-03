source 'https://rubygems.org'
ruby '2.1.0'
#ruby-gemset=railstutorial_rails_4_0

  gem 'rails', '4.0.2'
  gem 'bootstrap-sass', '2.3.2.0'
  gem 'bcrypt-ruby', '3.1.2'
  gem 'pg'
  gem 'sass-rails', '~> 4.0.2'
  gem 'uglifier', '2.1.1'
  gem 'coffee-rails', '4.0.1'
  gem 'jquery-rails', '3.0.4'
  gem 'turbolinks', '1.1.1'
  gem 'jbuilder', '1.0.2'
  gem 'faker', '1.1.2'
  gem 'will_paginate', '3.0.4'
  gem 'bootstrap-will_paginate', '0.0.9'
  gem 'devise'
  
group :development, :test do

  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.4.0'
  gem 'sqlite3'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'rails_12factor'
end