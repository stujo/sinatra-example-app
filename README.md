# Email De-duplication Service

## Overview

> Goal to de-duplicate 100,000 emails in less than 1 second

## Tools

* ruby - Selected Language
* rspec - Testing
* Faker - Generate Random Emails
* Sinatra - Web App Server

## Installation

```
$ bundle install
```

## Testing

```
$ bundle exec rspec
```

Because the performance test is slow we exclude it from the default test suite via ``.rspec``. In order to run it use this:

```
$ bundle exec rspec --tag slow
```

## Next Steps

* Add Web Front End


