source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'puma', '~> 5.6'
gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers', '~> 0.10.2'
gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'rack-cors'
gem 'faker', '~> 2.18.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "jwt", "~> 2.2"