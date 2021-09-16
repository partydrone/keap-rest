# Keap::REST

![example workflow](https://github.com/partydrone/keap-rest/actions/workflows/ci.yml/badge.svg) [![Maintainability](https://api.codeclimate.com/v1/badges/56adf33da4a7588ea186/maintainability)](https://codeclimate.com/github/partydrone/keap-rest/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/56adf33da4a7588ea186/test_coverage)](https://codeclimate.com/github/partydrone/keap-rest/test_coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'keap-rest'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install keap-rest

## Configuration

Use the configuration object to configure the client:

```ruby
Keap::REST.configure do |config|
  config.client_id = "my_client_id"
  config.client_secret = "my_client_secret"
  config.redirect_uri = "http://localhost:3000"
end
```

### Using Environment Variables

You can also set th

## Authentication

To make calls against the Keap REST API you will need to first obtain an Access
Token by requesting authorization, then trading in the resulting code. You will
receive a Refresh Token along with it, allowing you to create new Access Tokens
as they expire.

### Rails Example

In a view file, create a link to the APIs authorization endpoint:

```erb
<%= link_to "Get Keap access token", Keap::REST::Token.auth_url %>
```

If you didn't configure the gem with a default `redirect_uri`, or you want to
override it, you can include it in the method call:

```erb
<%= link_to "Get Keap access token", Keap::REST::Token.auth_url(redirect_uri: "http://localhost:3000/auth/keap/callback") %>
```

In your callback controller, use the `code` returned by the authorization
request to request an Access Token:

```ruby
class AuthController < ApplicationController
  def keap
    token = Keap::REST::Token.request(code: params[:code])
  end
end
```

> :warning: If you didn't configure a default `redirect_uri` for the gem, you
> must include the same `redirect_uri` used in your authorization request:
> `Keap::REST::Token.request(code: params[:code], redirect_uri: "http://localhost:3000/auth/keap/callback")`

## Usage

```ruby
# Provide authentication credentials
client = Keap::REST::Client.new(access_token: "my_access_token")

# Get current account profile
client.account_profile

# Get a list of contacts
contacts = client.contacts

# …or a single contact
contact = client.contact(42)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/keap-rest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/keap-rest/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Keap::Rest project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/keap-rest/blob/main/CODE_OF_CONDUCT.md).
