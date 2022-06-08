# Jungle

A mini e-commerce application built with Rails 6.1.
Navigating an existing code-base and using the existing code style, the following new features were implemented.

* Sold Out Badge
  - When Product has 0 quantity, a sold out badge is displayed on the product list page and the add button is disabled
* Admin Categories
  - Admin users can list and create new categories
  - Admin users can add new product using the new category
* User Authentication
  - Visitors can register and create an account from any page with e-mail, password, first and last name
  - Unique e-mail address is validated for registration
  - Passwords are saved securely leveraging the bcrypt gem
  - Visitors can sign in using the registered e-mail and password
* Order Details Page
  - After successful order, the page contains items, image, name, description, quantities and line item totals for detailed order info

The following bugs were fixed as well.

* Missing Admin Security
  - User must enter HTTP auth login/password to access funcitonality now
* Checkout page with an empty cart
  - When the cart is empty, the carts page will display a related message instead of an empty cart

## Testing 

The newly implemented features and functions were tested using rspec model testing and cypress E2E feature testing.
 
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
