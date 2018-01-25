source 'http://rubygems.org'

ruby '2.3.3'
gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'
gem 'pg', '~> 0.20'


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'sqlite3'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :production do
gem 'pg', '~> 0.20'
end
