# Sorry Succulents
#### By Michael Reiersgaard

# Technologies Used

* Ruby
* Rails
* PostgreSQL
* Bundler
* RSpec
* Pry
* Sinatra
* Capybara
* Faker
* Simplecov
* Devise

# Description
A two-day project to create a web portal for a Ruby on Rails website to manage one-to-many relationships between products and reviews. The second day focused on adding authentication for users of different scopes.

# Setup/Installation Requirements

## Intial Project Setup

* Ruby is required, download and install https://www.ruby-lang.org/en/documentation/installation/
* Bundler is required, install using the terminal with `gem install bundler`
* Ensure PostgreSQL is installed and correctly running on your local machine
* Create a directory to clone the public repository from GitHub using `git clone https://github.com/mireie/sorry_succulents`
* Enter the root of the project directory and install all gems with `bundle install`

## Initializing the Database
- Update the `config/database.yml` file to match your PostgreSQL setup
- Initialize the database with `rake db:migrate`
    - If you encounter errors here, your `database.yml` file is likely not set up correctly and you skipped the previous step!
- Seed the database with products and reviews with the terminal command `rake db:seed`

## Running the Application
- To run the site on your local machine in the terminal run `rails s`
- Open your browser and navigate to `localhost:3000` (default configuration

## Adding admins via the rails console
* To add an admin you must use the rails console with `rails console`
* Add the admin using the following format: `User.create(:email => "test@example.com", :password => "password", :admin => true)`
* You will now be able to login as an admin on the website at `http://localhost:3000/users/sign_in`
* You can also modify an existing user to make an admin with `rails c`. For a known `{user_id}`, run this command in the rails console: `User.find({user_id}).update(:admin => true)`


# Links
- [GitHub Repo](https://github.com/mireie/sorry_succulents)
- [Heroku](https://sorry-succulents.herokuapp.com/)

# Known Bugs

* No known bugs at this time.

# License

[MIT](https://en.wikipedia.org/wiki/MIT_License)

Copyright (c) 2021 Michael Reiersgaard

# Contact Information

Michael Reiersgaard michael.reiersgaard [at] gmail.com
