# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Create rails repostory
rails new story-book

# Set routes 
* config/routes.rb
root 'stories#index'
resources :stories 

# create controller 
rails g controller stories

# create model
rails g model story title description

# migrate database
rails db:migrate

# add bootstrap gem
gem 'bootstrap'
bundle install

# if you have application.css file then convert it to application.scss
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss

add @import "bootstrap"; to application.scss


# Now let's add hot-wire into application
gem "hotwire-rails"

run bundle install

# Then, you’ll install it.
rails hotwire:install