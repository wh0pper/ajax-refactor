# README

E-commerce site. Uses `bcrypt` and `materialize`. There's a seed file. Set up your own admin. If you have questions, I'll be in Bali with no email. Ask someone else.

To set up:

* `rake db:setup`

* Sorry, didn't get around to tests. It mostly works. There might be a few bugs.

## Updates from Jared
* Address bug when user doesn't input item quantity when adding to cart by defaulting value to 1
* Incorporate the following AJAX functionality for enhanced user experience
  * Add/Remove items to cart
  * Show/Hide product detail card
* Fix error in sign up routing  
