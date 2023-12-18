source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "telegram-bot-ruby"

gem 'httparty', '~> 0.21.0'

gem "net-http"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# Use sqlite3 as the database for Active Record
gem "pg"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "rack-cors"

group :development, :test do
  gem 'rspec-rails', '~> 6.1.0'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
end


