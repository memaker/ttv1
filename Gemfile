source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.9'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem "mongoid", ">= 3.0.18"
gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "capybara", ">= 2.0.2", :group => :test
gem "database_cleaner", ">= 0.9.1", :group => :test
gem "mongoid-rspec", ">= 1.5.6", :group => :test
gem "email_spec", ">= 1.4.0", :group => :test
gem "factory_girl_rails", ">= 4.1.0", :group => [:development, :test]
gem "less-rails", ">= 2.2.6", :group => :assets
gem "twitter-bootstrap-rails", ">= 2.1.8", :group => :assets
gem "libv8", ">= 3.11.8"
gem "therubyracer", ">= 0.11.3", :group => :assets, :platform => :ruby, :require => "v8"
gem "devise", ">= 2.2.2"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.0.4"
gem "quiet_assets", ">= 1.0.1", :group => :development
gem "figaro", ">= 0.5.3"
gem "better_errors", ">= 0.3.2", :group => :development
gem "binding_of_caller", ">= 0.6.8", :group => :development
gem "hub", ">= 1.10.2", :require => nil, :group => [:development]
gem "heroku"
gem "will_paginate-bootstrap"
# gem "stemmer" # not installed from source, so it is not needed
gem "classifier"
gem "madeleine"
gem "bayes_motel"
gem "sexmachine" # get gender from firstname
gem "crm114"

# needed for the collector script
gem 'tweetstream'
gem 'mongo'
gem 'bson_ext'
gem 'rgl'

group :production do
  gem "thin"
end