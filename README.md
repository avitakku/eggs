# Eggs

## Team Members:
Aditi Mutagi - agm2208 <br>
Avantika Garg - ag4049 <br>
Joshua Mei - jzm2103 <br>
Aryan Ray - ar4179 <br>

## Run Instructions
### 1. Running Locally:
   Start the rails server: rails server -b 0.0.0.0 <br>
   Click Box URL <br>
### 2. Running on Heroku:
### 3. Running Cucumber Tests:
    bundle exec rake db:drop db:create db:migrate db:seed
    rake db:migrate RAILS_ENV=test
    rake db:seed RAILS_ENV=test
    run rake cucumber
