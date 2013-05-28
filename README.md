Photeasy
====================

1. [Overview](#overview)
2. [Installation](#installation)

--------------------

## Overview

- Rails 4.0.0rc1
- Ruby 2.0.0-p0
- Backbone.js
- Dust.js (Templating)

[Back to Top ↑](#readme)

## Installation

1. Clone the repo: `git clone git@github.com:joelbeukelman/photeasy.git`
2. Install dependencies: `bundle install`
3. Install Postgres App: [http://postgresapp.com/](http://postgresapp.com/)
4. Create databases:
  - `psql -h localhost`
  - `create database photeasy_development;`
  - `create database photeasy_test;`
  - `\q` to quit postgresql
5. Copy `config/database.yml.example` to `config/database.yml` and update credentials
6. Migrate the database: `rake db:migrate`
7. Copy `config/application.yml.example` to `config/application.yml` and enter credentials
8. Install Imagemagick: `brew install imagemagick`

[Back to Top ↑](#readme)
