# APP NAME

Opiniated webpacker-less Rails setup with the latest Rails, using PostgreSQL, TailwindCSS, Stimulus, Hotwire and RSpec.

Using jsbundling-rails for javacript, and TailwindCSS through PostCSS with cssbundling-rails. For easy loading of all stimulus controllers
we use esbuild-rails as well.

This comes with a full docker setup for local development including system specs that can run on M1 Apple Docker instances (and also without docker).

## TL;DR

[with dip–CLI](https://github.com/bibendi/dip):

```sh
$ gem install dip
$ dip provision
$ dip rails s
# in another window 
$ dip yarn build
$ dip yarn build:css
```

Without dip:

```sh
bundle install
bin/rails db:create
bin/rails db:setup SAFETY_ASSURED=1
yarn install
bin/dev
```

## Provisioning and Interacting with Docker and dip

You need `docker` and `docker-compose` installed (for MacOS just use [official app](https://docs.docker.com/engine/installation/mac/)).

This app uses the [dip–CLI](https://github.com/bibendi/dip), a utility CLI tool for straightforward provisioning and interactions with applications configured by docker-compose.

## Code Guidelines

It uses [StandardRB](https://github.com/testdouble/standard) to automatically fix code style offenses.

```sh
dip standard
```

to automatically format the code with standard you can run:

```sh
dip standard --fix
```

## Running the specs

Inside the docker container we have 2 different commands. To just run the unit tests:

```sh
$ dip rspec
```

and to just run the system specs:

```sh
$ dip rspec system
```