# Sorry Succulents
#### By Michael Reiersgaard

## Technologies Used

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

## Description
A two-day project to create a web portal for a Ruby on Rails website to manage one-to-many relationships between products and reviews. The second day focused on adding authentication for users of different scopes.

## Setup/Installation Requirements

### Intial project setup

* Ruby is required, download and install https://www.ruby-lang.org/en/documentation/installation/
* Bundler is required, install using the terminal with `gem install bundler`
* Ensure PostgreSQL is installed and correctly running on your local machine
* Clone public repository from GitHub using `git clone https://github.com/mireie/sorry_succulents`
* Navigate to the project directory and install all dependencies with `bundle install`
* Create and enter a directory on your local machine for the project
* Seed the database with products and reviews with the terminal command `rake db:seed`
* To run tests, in the terminal run `rspec`
* To run the site on your local machine in the terminal run `rails s`
* Open your browser and navigate to `localhost:3000` (default configuration)

#### Adding admins via the rails console
* To add an admin you must use the rails console with `rails console`
* Add the admin using the following format: `User.create(:email => "test@example.com", :password => "password", :admin => true)`
* You will now be able to login as an admin on the website at `http://localhost:3000/users/sign_in`


## Links
- [GitHub Repo](https://github.com/mireie/sorry_succulents)
- [Heroku](https://sorry-succulents.herokuapp.com/)

## Known Bugs

* No known bugs at this time.

## License

[MIT](https://en.wikipedia.org/wiki/MIT_License)

Copyright (c) 2021 Michael Reiersgaard

## Contact Information

Michael Reiersgaard michael.reiersgaard [at] gmail.com
