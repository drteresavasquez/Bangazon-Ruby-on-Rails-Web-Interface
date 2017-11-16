# Bangazon LTD Web Interface

The Bangazon LTD Web Interface is created with emphasis on ERD Development, ERB view templates, Rails Models, Rails Controllers, Migrations and Authentication.

A user of this Web Interface can buy and sell items as well as interact with products on the site once authenticated.

## Software Versions
```
Rails 5.1.4
mysql  Ver 14.14
GEM: seed_dump https://github.com/rroblak/seed_dump
GEM: faker https://github.com/stympy/faker
```

## Get Started
To get started, navigate to the directory of your choice and run the following code in the command line
```
git clone https://github.com/Holyhead-Harpies/Bangazon-Ruby-on-Rails-Web-Interface.git
cd Bangazon-Ruby-on-Rails-Web-Interface
```
## Install

* [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Install Rails](https://github.com/tbsvttr/install-ruby-and-rails)
* GEM: seed_dump https://github.com/rroblak/seed_dump
* GEM: faker https://github.com/stympy/faker
* Install SQLite3
```
gem install sqlite3
```
## Initialize App

run commands in console
``` 
bundle install
```
then...
```
rails db:migrate
```
to seed the database...
```
rake db:repopulate
rails s
```
Visit localhost:3000 in web browser for Rails page

## Working With Shared Data
If you would like to use this project in a team environment, one team member will need to seed the database and then run the following command
```
rake db:seed:dump
```
All other team members will run the following commands in the console
``` 
bundle install
rails db:migrate
rails db:seed
rails s
```
Visit localhost:3000 in web browser for Rails page
## Contribute
Fork this repository and submit your contributions as a [pull request](https://github.com/Holyhead-Harpies/Bangazon-Ruby-on-Rails-Web-Interface/blob/master/PULL_REQUEST_TEMPLATE.md) using the PR template.

## Report Bugs
Create an [issue report](https://github.com/Holyhead-Harpies/Bangazon-Ruby-on-Rails-Web-Interface/issues/new)
## Meet the Dev Team
- [Bryon Larrance](https://github.com/)
- [Jeremy Wells](https://github.com/)
- [Fang-Wen Shen](https://github.com/)
- [Ted Collins](https://github.com/)
- [Dr. Teresa Vasquez](https://github.com/drteresavasquez)
