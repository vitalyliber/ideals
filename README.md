# iDeals

**ruby version:** 2.5.0

**gemset:** ideals

## How to start application for developing

Install postgres dependencies:

_For mac_

```
brew install libpq
```

_For linux_

```
apt-get install postgresql-client
```

Start postgres container:

```
docker-compose up
```

Create migrations:

```
rake db:create db:migrate
```

Run seeds:

```
rake db:seed
```

Start your Rails server:

```
rails start
```

Start WebPacker dev server:

```
./bin/webpack-dev-server
```

## How to start common tests

```
rspec
```

## On/Off caching in dev mode
```
rails dev:cache
```