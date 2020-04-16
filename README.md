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

You need the credentials key files. Ask CV if you do not already where to find them.


## Development

- Install dependencies: `bundle install`
- Rails server: `rails server`
- Rails console: `rails console`
- Edit encrypted credentials file: `rails credentials:edit --environment development` (or `production`, or omit the `--environment` flag to edit `config/master.key`)
