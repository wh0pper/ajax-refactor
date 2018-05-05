# README

## Description:
Basic E-commerce site built using Ruby on Rails. Uses `bcrypt` for authentication and `materialize` design.

## To set up:
Assuming you have ruby and rails installed on your machine, from the terminal, clone or download project
* `$ git clone https://github.com/wh0pper/ajax-refactor`

install dependencies
* `$ bundle install`

create and seed database locally
* `$ rake db:setup`

run tests
* `$ rspec`

run on local server
* `$ rails server`

## Use:
Once running locally, you can register a new account to test functionality. If you've seeded the database you can access a default admin account by logging in with 'admin@email.com' & 'password' to preview admin priveleges.

## Developer updates
Previous developer left this project in a tragic state. I've since implemented the following updates:
* Address bug when user doesn't input item quantity when adding to cart by defaulting value to 1
* Incorporate the following AJAX functionality for enhanced user experience
  * Add/Remove items to cart
  * Show/Hide product detail card
* Fix error in sign up routing  
* Fix bugs and inconsistencies in order creation/retrieval process
* Add flash messages to additional user stories
* Add admin role with CRUD functionality for products
* Add validations for uniqueness of products and users
* Add validation to safeguard prices of new products
* Set up models with dependent destroy to avoid database clutter
