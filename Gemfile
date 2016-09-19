source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails',             github: 'rails/rails'
gem 'jsonapi-resources', github: 'cerebris/jsonapi-resources'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'annotate', '~> 2.7.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-byebug', '~> 3.4.0'
  gem 'dotenv-rails', '~> 2.1.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
