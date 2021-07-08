# APP NAME

## Running the specs

After a clean provisioning, before you can run the specs, you will have setup the test database like so:

```sh
$ bundle exec rails db:test:prepare
```

When using the Docker setup with Dip we have specify the RAILS_ENV like so:

```sh
$ RAILS_ENV=test dip bundle exec rails db:test:prepare
```

You can then run the specs:

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

## Code Guidelines

An optional (but highly recommended) pre-commit git hook template is provided as part of the codebase.

It uses [StandardRB](https://github.com/testdouble/standard) to automatically fix code style offenses. Install it in your local repo with:

```sh
$ cp git-hooks/pre-commit .git/hooks/pre-commit && chmod a+x .git/hooks/pre-commit
```
## Provisioning and Interacting with Docker and dip

You need `docker` and `docker-compose` installed (for MacOS just use [official app](https://docs.docker.com/engine/installation/mac/)).

This app uses the [dip–CLI](https://github.com/bibendi/dip), a utility CLI tool for straightforward provisioning and interactions with applications configured by docker-compose.

### Installing dip

To install dip, copy and run the command below. More installation options are found here: https://github.com/bibendi/dip#installation

```sh
$ gem install dip
```

NOTE: If needed, install the correct version of ruby locally. The current version is listed at the top of the Gemfile but should also be automatically recognized by your shell. For example, at its current version, if you're using rbenv, run: `rbenv install 3.0.0`

### App Installation (dip)

Now that we have dip installed, installing and setting up the application is just a single command:

```sh
# provision application (this will take a while)
$ dip provision
```

### dip Commands (rails server, console)

Use these commands to easily interact with the newly installed app:

```sh
# run web app with all debuging capabilities (i.e. `binding.pry`)
$ dip rails s

# run rails console
$ dip rails c
```

## Provisioning and Interacting with docker-compose

### Alternate App Installation

Since dip uses docker-compose under the hood, everything is already configured; you can also use the following commands to prepare your Docker dev env:
NOTE: These commands are essentially instead of `dip provision`.

```sh
$ docker-compose build
$ docker-compose run runner yarn install
$ docker-compose run runner ./bin/setup
```

This builds the Docker image, installs Ruby and NodeJS dependencies, creates database, run migrations and seeds.

### docker-compose Commands

You can run the Rails app using the following command:

```sh
$ docker-compose up rails
```