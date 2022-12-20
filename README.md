# FounderDigest
a Rails 7 boilerplate template by [@ryanckulp](https://twitter.com/ryanckulp), created to ship SaaS apps quickly. Learn how to use this at [24 Hour MVP](https://founderhacker.com/24-hour-mvp).


## Installation
1. clone the repo
2. `cd founder_digest && bin/setup`
3. `cp config/application-sample.yml config/application.yml`
3. get `config/application.yml` values from repo admin

3. `rails g rename:into new_app_name` (then `cd ../new_app_name` to refresh)
4. remove `gem 'rename'` from Gemfile, then `bin/setup` to create DB
5. `bundle exec figaro install`
6. `cp config/application-sample.yml config/application.yml` (put ENV vars here)

## Development
```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```


## Testing
```
bundle exec rspec # run all tests inside spec/
bundle exec rspec spec/dir_name # run all tests inside given directory
```

## Miscellaneous
to use Postmark for emails, set `postmark_api_token` inside `application.yml`, then [verify your sending domain](https://account.postmarkapp.com/signature_domains/initialize_verification).
