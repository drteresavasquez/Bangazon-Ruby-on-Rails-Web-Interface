# Bangazon LTD Web Interface

The Bangazon LTD Web Interface is created with emphasis on ERD Development, ERB view templates, Rails Models, Rails Controllers, Migrations and Authentication.

A user of this Web Interface can buy and sell items as well as interact with products on the site once authenticated.

A deployed version of the app can be found at [https://stark-woodland-67672.herokuapp.com/](https://stark-woodland-67672.herokuapp.com/).

## Software Versions

Ruby 2.4.2

Rails 5.1.4

MySQL 14.14

## Get Started
To get started, navigate to the directory of your choice and run the following commands in the terminal.
```
$ git clone https://github.com/Holyhead-Harpies/Bangazon-Ruby-on-Rails-Web-Interface.git
$ cd Bangazon-Ruby-on-Rails-Web-Interface
```
## Installation

* [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Install Rails](https://github.com/tbsvttr/install-ruby-and-rails)

## Initialize App

Run the following commands in the terminal:
```
$ brew install imagemagick
```
``` 
$ bundle install --without production
```
then...
```
$ rails db:migrate
```
to seed the database...
```
rails db:seed
```
initialize the rails server...
```
rails server
```
Visit http://localhost:3000 in your web browser for the Bangazon page.

## Unit and Integration Tests
User signup and login methods have test coverage. To run tests

```
rails test
```

## Contribute
Fork this repository and submit your contributions as a [pull request](https://github.com/Holyhead-Harpies/Bangazon-Ruby-on-Rails-Web-Interface/blob/master/PULL_REQUEST_TEMPLATE.md) using the PR template.

## Report Bugs
Create an [issue report](https://github.com/Holyhead-Harpies/Bangazon-Ruby-on-Rails-Web-Interface/issues/new)

## Meet the Dev Team
- [Bryon Larrance](https://github.com/beelarr)
- [Dr. Teresa Vasquez](https://github.com/drteresavasquez)
- [Jeremy Wells](https://github.com/jsheridanwells)
