# Rails starter template

![rspec](https://ruby.ci/badges/278d4d52-dcc5-4bd2-aa30-25d7845eeef1/rspec)
![standard](https://ruby.ci/badges/278d4d52-dcc5-4bd2-aa30-25d7845eeef1/standard)
![brakeman](https://ruby.ci/badges/278d4d52-dcc5-4bd2-aa30-25d7845eeef1/brakeman)
![bundler_audit](https://ruby.ci/badges/278d4d52-dcc5-4bd2-aa30-25d7845eeef1/bundler_audit)

Opinionated Rails setup using Rails 7, PostgreSQL, TailwindCSS, Stimulus, Hotwire and RSpec.

We are bundling JavaScript and CSS through a Node-based setup with [`jsbundling-rails`](https://github.com/rails/jsbundling-rails) and [`cssbundling-rails`](https://github.com/rails/cssbundling-rails) and for the asset pipeline we are using [`propshaft`](https://github.com/rails/propshaft).

You need the following installed:

* Ruby >= 3 (`asdf install`)
* Node 19 (`asdf install`)
* Bundler (`gem install bundler`)
* Yarn (`brew install yarn`)
* Overmind (`brew install tmux overmind`)
* Postgresql (`brew install postgresql` start with: `brew services start postgresql`)
* Redis (`brew install redis` start with: `brew services start redis`)

If you are using [asdf](https://asdf-vm.com/) (I recommend that you do :) ) you can install the required Ruby and NodeJS versions with `asdf install`

The Homebrew dependencies can be installed with running:

```bash
brew bundle install --no-upgrade
```

Additional Homebrew dependencies can be added to the `Brewfile`

Optional: [Docker](https://docs.docker.com/engine/installation/mac/) to use with the preconfigured `dip.yml` to setup a dockerized dev environment using [dip](https://github.com/bibendi/dip)

## Getting started

### Initial application setup

Run the setup script that will run the needed setup steps for the application, installing all gems and packages, database preparing etc.

```sh
$ bin/setup
```

#### Provisioning and interacting with Docker and dip

You need `docker` and `docker-compose` installed (for MacOS just use [official app](https://docs.docker.com/engine/installation/mac/)).

This app uses the [dip](https://github.com/bibendi/dip) CLI, a utility CLI tool for straightforward provisioning and interactions with applications configured by docker-compose.

```sh
$ gem install dip
$ dip provision
```

Take a look at the `dip.yml` file for the available commands

### Development

Will run Overmind (or Foreman if Overmind is not installed), builds all assets automaticly and will start the rails server and sidekiq

```sh
$ bin/dev
```

When using dip:

```
$ dip up web
```

## Code Guidelines

It uses [StandardRB](https://github.com/testdouble/standard) for Ruby to automatically fix code style offenses.

```sh
$ bundle exec standardrb
```

to automatically format Ruby with StandardRB you can run:

```sh
$ bundle exec standardrb --fix
```

For Javascript we use [StandardJS](https://standardjs.com/).

```sh
$ yarn standard
```

to automatically format the javascript with StandardJS you can run:

```sh
$ yarn standard --fix
```

## Running the specs

Inspired by [Evil Martians - System of a Test article](https://evilmartians.com/chronicles/system-of-a-test-setting-up-end-to-end-rails-testing)

To run all the specs you can run:

```sh
$ rake
```

or use RSpec directly with

```sh
$ bundle exec rspec
```

Inside the docker container we have 2 different commands. To just run the unit tests:

```sh
$ dip rspec
```

and to just run the system specs:

```sh
$ dip rspec system
```
