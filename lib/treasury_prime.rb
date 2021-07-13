require "treasury_prime/version"
require "faraday"
require "faraday_middleware"
require "faraday_curl"
require "date"
require "dry-struct"
require "dry-monads"

module TreasuryPrime
  autoload :Configuration,              "treasury_prime/configuration"
  autoload :Types,                      "treasury_prime/types"
  autoload :Request,                    "treasury_prime/request"

  autoload :PaginatedCollection,        "treasury_prime/paginated_collection"

  autoload :PersonApplicationRequest,   "treasury_prime/requests/person_application_request"
  autoload :PersonApplication,          "treasury_prime/responses/person_application"
  autoload :AccountApplicationRequest,  "treasury_prime/requests/account_application_request"
  autoload :AccountApplication,         "treasury_prime/responses/account_application"
  autoload :Account,                    "treasury_prime/responses/account"
  autoload :Person,                     "treasury_prime/responses/person"
  autoload :CardProduct,                "treasury_prime/responses/card_product"

  autoload :Card,                       "treasury_prime/responses/card"
  autoload :CardUpdateRequest,          "treasury_prime/requests/card_update_request"
  autoload :CardCreateRequest,          "treasury_prime/requests/card_create_request"

  autoload :CardToken,                  "treasury_prime/responses/card_token"

  autoload :Transaction,                "treasury_prime/responses/transaction"
  autoload :Webhook,                    "treasury_prime/responses/webhook"

  autoload :BaseClient,                 "treasury_prime/base_client"
  autoload :Client,                     "treasury_prime/client"
  autoload :Response,                   "treasury_prime/response"
  autoload :Error,                      "treasury_prime/error"

  @api_base = "https://api.treasuryprime.com/"

  class << self
    attr_accessor :api_base, :username, :token, :debug_logger

    def client
      @client ||= Client.new(
        api_base: TreasuryPrime.api_base,
        username: TreasuryPrime.username,
        token: TreasuryPrime.token
      )
    end
  end
end
