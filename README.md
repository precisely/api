# Precisely Back-End Code

This repository houses the Precisely back-end code.


## Installation

This project requires Ruby. If you already know how to wrangle Ruby installations, skip the rest of this section.

For development, using [rbenv](https://github.com/rbenv/rbenv) to deal with Ruby installation is recommended. Optionally, [direnv](https://direnv.net) can help manage the environment as well. If you use both these tools, make a `.envrc` file in this directory, and add the following lines:
```
use rbenv
PATH_add bin
```
Or, if you already have `use rbenv` in a `.envrc` file in a parent directory, add the following instead:
```
source_up
PATH_add bin
```


## Configuration

- You need the credentials key files. Ask CV if you do not already where to find them.
- Make a personal `.env` file using `.env.sample` as a template.


## Development

- Install Bundler: (from the project directory!) `gem install bundler`
- Install dependencies: `bundle install`
- Rails server: `rails server`
- Rails console: `rails console`
- Edit encrypted credentials file: `rails credentials:edit --environment development` (or `production`, or omit the `--environment` flag to edit `config/master.key`)


## Deployment

The app is currently deployed in Heroku. A Heroku environment requires:

- environment variable `STAGE` set to the environment (`staging` and `production` are good examples)
- environment variable `RAILS_MASTER_KEY` matching `config/credentials/production.key` (no, _not_ `config/master.key`!)
- environment variable `EMAIL_DOMAIN`
- environment variable `FRONTEND_URL`
- two databases, one for identity data and one for everything else
- environment variable `HEROKUDB_ENV_VAR_DEFAULT` set to `DATABASE_URL`
- environment variable `HEROKUDB_ENV_VAR_IDENTITY` set to the _name_ of the environment variable which is itself set to the identity database's access URL — the indirection is required to support multiple environments!

Note that a pipeline is not used here. Although it would work here, it would create an inconsistent deployment experience with the front-end `app`, which cannot use a pipeline (see [the `app` README](https://github.com/precisely/app/blob/dev/README.md)).
