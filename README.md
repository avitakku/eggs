# Eggs

## Team Members:
Aditi Mutagi - agm2208 <br>
Avantika Garg - ag4049 <br>
Joshua Mei - jzm2103 <br>
Aryan Ray - ar4179 <br>

## Run Instructions
### 1. Running Locally:
   Run the following commands:
   
      sudo apt-get update 
      sudo apt-get install libpq-dev
      bundle install
   Start the rails server: rails server -b 0.0.0.0 <br>
   Click Box URL <br>
### 2. Running on Heroku:
   https://i-love-eggs-d229c21e8c11.herokuapp.com/goods_services
### 3. Running Cucumber + RSpec Tests:
       bundle exec rake db:drop db:create db:migrate db:seed
       rake db:migrate RAILS_ENV=test
       rake db:seed RAILS_ENV=test
       rake cucumber
       rake spec

## To Test Add Friends
   You can use the following friend keys to test the "Add Friends" feature for our seed users: 
      
       Aditi Mutagi - 12345 
       Avantika Garg - 67890 
       Aryan Ray - 94213 
       Joshua Mei - 15842 

## To Test Different Users
   You can use the following login credentials to test our different seed users (or add your own):

      Aditi Mutagi - username: agm2208; password: defaultPassword
      Avantika Garg - username: ag4049; password: defaultPassword
      Aryan Ray - username: ar4179; password: defaultPassword
      Joshua Mei - username: jzm2103; password: defaultPassword
