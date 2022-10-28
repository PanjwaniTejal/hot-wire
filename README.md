# Create rails repostory
rails new story-book

# Set routes config/routes.rb
root 'stories#index'

resources :stories 

# Create controller 
rails g controller stories

# Create model
rails g model story title description

# Migrate database
rails db:migrate

# Add bootstrap gem
gem 'bootstrap'
bundle install

# If you have application.css file then convert it to application.scss
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss

add @import "bootstrap"; to application.scss

# Add font-awesome gem for icon
gem "font-awesome-rails"
bundle install

# Add below code into app/assets/stylesheets/application.scss
@import "font-awesome";

# Now let's add hot-wire into application
gem "hotwire-rails"
# Run 
bundle install

# Then, you’ll install it.
rails hotwire:install

# Install jqury 
yarn add jquery

# Add below line into app/javascript/packs/application.js
require("jquery")

# Add below code into config/webpack/environment.js
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)


# Change button_to to link_to for delete link
https://stackoverflow.com/questions/70474422/rails-7-link-to-with-method-delete-still-performs-get-request
