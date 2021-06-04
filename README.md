# Treasury Prime

Ruby bindings of Treasury Prime API

## Installation

Add this line to your application's Gemfile:

    gem 'treasury_prime', github: "grabr/treasury_prime-ruby"

And then execute:

    $ bundle

## Usage

### Class method APIs
At first, set `TreasuryPrime.api_key` or `TreasuryPrime.access_token`.

```ruby
TreasuryPrime.username = "XXX"
TreasuryPrime.token = "XXX"
TreasuryPrime.api_base = "XXX"
```


### Instance method APIs
```ruby
client = TreasuryPrime.client
#or
client = TreasuryPrime::Client.new(username: "XXX", token: "XXX")
```

Then call instance methods.

e.g. create card.

```ruby
client.create_card(account_id: "acc_123", person_id: "per_123", card_product_id: "cprd_123")
```

All available APIs are followings.

* [TreasuryPrime::Account](lib/treasury_prime/client/account_methods.rb)
* [TreasuryPrime::Person](lib/treasury_prime/client/person_methods.rb)
* [TreasuryPrime::Card](lib/treasury_prime/client/card_methods.rb)
* [TreasuryPrime::CardProduct](lib/treasury_prime/client/card_product_methods.rb)
* [TreasuryPrime::AccountApplication](lib/treasury_prime/client/account_application_methods.rb)
* [TreasuryPrime::PersonApplication](lib/treasury_prime/client/person_application_methods.rb)



## Tips
### Dry::Struct
All successful API methods returns `Dry::Struct` [instance](lib/treasury_prime/responses) wrapped in Success monad.

https://github.com/dry-rb/dry-struct
https://github.com/dry-rb/dry-monads

All unsuccessful API Methods return one of the error [instances](lib/treasury_prime/error) wrapped in Failure monad.


### Block arguments
All API methods supports block argument.

If block was given, return response body and response header through block arguments.

```ruby
client.create_account_application(person_application_id: "123", product: :personal_savings) do |body, header|
  body

  header["X-RateLimit-Limit"]
  #=> "100"
end
```

## Play around
```bash
cp .env.example .env
vi .env

./bin/console
```
