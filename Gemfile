source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#require 'thumbs_up'


gem 'rails',      '6.0.0'
gem 'puma',       '3.12.1'

gem 'webpacker',  '4.0.7'

gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.4', require: false



#LoginGoogle
gem 'omniauth-google-oauth2'

#Vote System
gem 'acts_as_votable'


group :development, :test do
  gem 'sqlite3', '1.4.1'
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do

  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',           '3.28.0'
  gem 'selenium-webdriver', '3.142.4'
  gem 'webdrivers',         '4.1.2'
end

group :production do
  gem 'pg', '1.1.4'
end

gem 'carrierwave'   
gem 'bootstrap-sass'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]