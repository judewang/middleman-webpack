# middleman-webpack

A middleman template using webpack to replace middleman asset pipeline.

## Requirements

- NodeJS
- Ruby
- Bundler installed
- npm or yarn installed

## Usage

Install pacakge

1. `bundle install`
2. `yarn` or `npm install`

Run develop server

    npm start
    # or
    bundle exec middleman

Build static sources

    npm run build
    # or
    bundle exec middleman build

Build production-ready site

    npm run build:staging
    # or
    TARGET=staging bundle exec middleman build

Deploy

    npm run deploy

## TODO

- Update README
- Update credits
