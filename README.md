# README

E-commerce site. Uses `bcrypt` and `materialize`. There's a seed file. Set up your own admin. If you have questions, I'll be in Bali with no email. Ask someone else.

## To set up:
Assuming you have ruby and rails installed on your machine, clone or download project
* `git clone https://github.com/wh0pper/ajax-refactor`

install dependencies
* `bundle install`

create and seed database locally
* `rake db:setup`

run on local server
* `rails server`


## Updates from Jared
Previous developer left this project in a tragic state. I've since implemented the following updates:
* Address bug when user doesn't input item quantity when adding to cart by defaulting value to 1
* Incorporate the following AJAX functionality for enhanced user experience
  * Add/Remove items to cart
  * Show/Hide product detail card
* Fix error in sign up routing  
* Fix bugs and inconsistencies in order creation/retrieval process
* Add flash messages to additional user stories
* 
