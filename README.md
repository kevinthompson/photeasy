Photeasy
====================

This is the source code for [Photeasy](http://photeasy.com), a project that [Joel Beukelman](http://bkl.mn), [Dylan Hudson](https://twitter.com/dyln_hdsn)
and [myself](http://kevinthompson.info) worked on in the Summer of 2013. Unfortunately, we were unable to
complete the project, but we wanted to make the source available as an example
of a Rails application with a versioned API and a Backbone.js front-end.

Feel free to open an issue, or contact me at [kevin@kevinthompson.info](mailto:kevin@kevinthompson.info) if you have any questions.

What follows is the rest of the original README.

-------------------

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

1. Clone the repo: `git clone git@github.com:kevinthompson/photeasy.git`
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
