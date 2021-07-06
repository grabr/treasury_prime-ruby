module TreasuryPrime
  class Client < BaseClient
    autoload :PersonApplicationMethods,     "treasury_prime/client/person_application_methods"
    autoload :AccountApplicationMethods,    "treasury_prime/client/account_application_methods"
    autoload :AccountMethods,               "treasury_prime/client/account_methods"
    autoload :PersonMethods,                "treasury_prime/client/person_methods"
    autoload :CardMethods,                  "treasury_prime/client/card_methods"
    autoload :CardProductMethods,           "treasury_prime/client/card_product_methods"
    autoload :TransactionMethods,           "treasury_prime/client/transaction_methods"
    autoload :WebhookMethods,               "treasury_prime/client/webhook_methods"

    include AccountMethods
    include PersonMethods
    include CardMethods
    include CardProductMethods
    include AccountApplicationMethods
    include PersonApplicationMethods
    include TransactionMethods
    include WebhookMethods

    include Dry::Monads[:result]

    def initialize(username: nil, token: nil, api_base: nil, headers: {})
      @username = username || TreasuryPrime.username
      token    ||= TreasuryPrime.token
      api_base    ||= TreasuryPrime.api_base
      super(api_base: api_base, username: @username, token: token, headers: headers)
    end

    def inspect
      %Q(#<TreasuryPrime::Client:0x#{"%016X" % object_id} @username="#{@username}">)
    end

    private

    def wrap_response(wrapper)
      yield.fmap do |payload|
        if payload["data"] && payload["data"].is_a?(Array)
          PaginatedCollection.from_payload(payload, wrapper)
        else
          wrapper.new(payload)
        end
      end
    end

    def default_headers
      {
        "User-Agent" => "TreasuryPrime v#{TreasuryPrime::VERSION}",
        "Content-Type" => "application/json",
      }
    end

    def headers
      { "X-USER-TOKEN" => "ASDF" }.merge(default_headers)
    end
  end
end
