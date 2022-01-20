# Rails starter template

Opiniated Rails setup with the latest Rails, using PostgreSQL, TailwindCSS, Stimulus, Hotwire and RSpec.

Using jsbundling-rails for javacript, and TailwindCSS through PostCSS with cssbundling-rails. For easy loading of all stimulus controllers
we use esbuild-rails.

You need the following installed:

* Ruby >= 3
* Bundler (`gem install bundler`)
* Node (`brew install node`)
* Yarn (`brew install yarn`)
* Overmind (`brew install tmux overmind`)
* Postgresql (`brew install postgresql` start with: `brew services start postgresql`)
* Redis (`brew install redis` start with: `brew services start redis`)

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

When using dip & overmind:

```
$ overmind s -f Procfile.dip.dev
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
