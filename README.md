# Email De-duplication Service

## Overview

> Service to de-duplicate 100,000 emails in less than 1 second

## Tools

* Sinatra - Web App Server
* rspec - Testing
* Faker - Generate Random Emails

## Installation

```
$ bundle install
```

## Testing

To run the basic tests:

```
$ bundle exec rake
```

Because the performance test is slow we exclude it from the default test suite via ``.rspec``. In order to run it use this:

```
$ bundle exec rake specs:all
```

## Build

This project uses the sass version of materialize, if you make any changes you'll need to rebuild the css files

```
$ rake sass
```

## Start Server

This project uses sinatra, which is based on rack 

**Note:** No database is required for this app

```
$ rackup
```
