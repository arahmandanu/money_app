# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version
  - 3.1.0

## System dependencies
  - Postgres

## Configuration
  1. install ruby with version 3.1.0
  2. install postgress
  3. copy file env.example and rename to
    - development (.env.development)
    - test (.env.test)
  4. fill the env in according to your needs
    - DATABASE_NAME
    - DATABASE_USERNAME
    - DATABASE_PASSWORD
    - DATABASE_HOSTNAME
    - RAPID_API_STOCK_URL (get from your rapid api .com)
    - RAPID_API_HOST (get from your rapidapi.com > x-rapidapi-host)
    - RAPID_API_KEY (get from your rapidapi.com > x-rapidapi-key)

## Database creation
  * for development
    - rake db:create
    - rake db:migrate
    - rake seed:migrate
  * for test
    - RAILS_ENV=test rails db:create
    - RAILS_ENV=test rails db:migrate

## How to run the test suite
  Make sure database is ready to use for test
  then run "rspec ." inside console on your root repositories

## Services (job queues, cache servers, search engines, etc.)
  - no background job for now

## Deployment instructions
  - no need deployment since this only for testing

## Testing using Development env
  there is initial user you can use
  - email => initial_user@mail.com
  - password => 123456789

  1. run in console "rake assets:precompile" to generate all asset
  2. run 'rails s'
  3. access swagger inside
    domain.com/open/_doc
  4. first access Authentication Api then retrive the token
  5. access any open api using token from step 3
