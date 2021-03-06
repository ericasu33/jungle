# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by exawmple.

## ScreenShots
!["Homepage"](https://github.com/ericasu33/jungle/blob/master/public/Screen%20Shot%202021-01-13%20at%204.12.33%20PM.png?raw=true)
!["My Cart"](https://github.com/ericasu33/jungle/blob/master/public/Screen%20Shot%202021-01-13%20at%204.13.26%20PM.png?raw=true)
!["Order Confirmation"](https://github.com/ericasu33/jungle/blob/master/public/Screen%20Shot%202021-01-13%20at%204.14.10%20PM.png?raw=true)

# Features
* Add/Delete Products
* Add Categories
* Admin Dashboard
* Sends confirmation email to registered user
  - To use this funciton, please replace "default@gmail.com" with your own email in the following files:
   - application_mailer.rb
   - order_receipt_mailer.rb
   - development.rb
      => For this file, if your email is not gmail, make sure you modify the remaining smtp_settings accordingly.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
