source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "sorcery", "0.16.5"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Add oauth and oauth2 dependencies for Sorcery
gem "oauth", "~> 1.1.0"
gem "oauth2", "~> 2.0.9"

# Optional bcrypt for user authentication
gem "bcrypt", "~> 3.1.7"
