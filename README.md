# Peasy
[![Gem Version](https://badge.fury.io/rb/peasy.svg)](https://badge.fury.io/rb/peasy)

An Easy Peasy way to use LemonSqueezy.

This gem lets you use the LemonSqueezy API to manage subscriptions from your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'peasy'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install peasy

## Usage

This is super basic, and there are currently no tests. Probably don't use in production unless you know what the code does.

### Create Initializer
Add a `peasy.rb` file to your initializers folder, defining your API key. The LemonSqueezy API keys don't always play nice with Rails credentials, so you might need to split if over several lines in your credentials and then gsub the linebreaks.

```
Peasy.configure do |config|
  config.key = Rails.application.credentials.lemonsqueezy_api_key
end
```

### Get Subscription

If you know the subscription ID from LemonSqueezy (likely you've saved it already to your application's database), you can query the API to get the response.

```
Peasy::Subscription.find(SUBSCRIPTION_ID)
```

### Cancel Subscription

As above, if you know the subscription ID from LemonSqueezy, you can instruct the API to cancel the relevant subscription.

```
Peasy::Subscription.cancel(SUBSCRIPTION_ID)
```

## To Do

There's a lot of endpoints left to map here, and there's also going to be some refactoring to do and tests to write

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
