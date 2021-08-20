# APP NAME

Opiniated webpacker-less Rails setup with the latest Rails, using PostgreSQL, TailwindCSS, Stimulus, Hotwire and RSpec.

This comes with a full docker setup for local development including system specs that can run on M1 Apple Docker instances (and also without docker).

## TL;DR

[with dip–CLI](https://github.com/bibendi/dip):

```sh
$ gem install dip
$ dip provision
$ dip rails s
# in another window 
$ dip npm start
```

Without dip:

```sh
bundle install
bin/rails db:create
bin/rails db:setup SAFETY_ASSURED=1
npm install
bundle exec rails s
# in another window 
npm start
```

## Provisioning and Interacting with Docker and dip

You need `docker` and `docker-compose` installed (for MacOS just use [official app](https://docs.docker.com/engine/installation/mac/)).

This app uses the [dip–CLI](https://github.com/bibendi/dip), a utility CLI tool for straightforward provisioning and interactions with applications configured by docker-compose.

### Installing dip

To install dip, copy and run the command below. More installation options are found here: https://github.com/bibendi/dip#installation

```sh
$ gem install dip
```

NOTE: If needed, install the correct version of ruby locally. The current version is listed at the top of the Gemfile but should also be automatically recognized by your shell. For example, at its current version, if you're using rbenv, run: `rbenv install 3.0.2`

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

After a clean provisioning, before you can run the specs, you will have setup the test database like so:

When using the Docker setup with Dip we have specify the RAILS_ENV like so:

```sh
$ dip bundle exec rails db:test:prepare RAILS_ENV=test
```

Inside the docker container we have 2 different commands. To just run the unit tests:

```sh
$ dip rspec
```

and to just run the system specs:

```sh
$ dip rspec system
```

## Running Tailwind JIT

To use the JIT tailwind we have to run a seperate console and run:

```sh
$ dip npm start
```

The output will be something like this:

```
Creating app_rails_run ... done

> app@1.0.0 start
> tailwindcss -i ./app/assets/stylesheets/tailwind.css -o ./app/assets/stylesheets/tailwind-build.css --watch


warn - You have enabled the JIT engine which is currently in preview.
warn - Preview features are not covered by semver, may introduce breaking changes, and can change at any time.

Rebuilding...
Done in 104ms.
```

## Adding javascript libraries

Since we are using [grundler](https://github.com/johanhalse/grundler) (and not webpacker 🎉), we need to use the importmap provided by [stimulus-rails](https://github.com/hotwired/stimulus-rails) (This is installed through the [hotwire-rails](https://github.com/hotwired/hotwire-rails) gem.)

Grundler is configured to store all packages in the `app/javascript/libraries` folder. This way these libraries are automaticly picked up by the importmap.

For example to use the `confetti` package we can do the following:

```sh
bundle exec grundle add canvas-confetti
```

Then in a stimulus controller add the following:

```js
import confetti from 'libraries/canvas-confetti'
```

we can now execute the `confetti()` function on our stimulus controller, for example on the connect:

```js
connect(){
  confetti();
}
```
