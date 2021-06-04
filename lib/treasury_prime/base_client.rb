module TreasuryPrime
  class BaseClient

    include Dry::Monads[:result]

    def initialize(api_base:, username:, token:, headers: {})
      default_headers.merge!(headers)
      @conn = Faraday.new(url: api_base, headers: default_headers) do |conn|
        conn.basic_auth(username, token)
        conn.request :json
        conn.response :json

        if TreasuryPrime.debug_logger
          conn.request :curl, TreasuryPrime.debug_logger, :debug
          conn.response :logger, TreasuryPrime.debug_logger
        end

        conn.adapter Faraday.default_adapter
      end
    end

    Faraday::Connection::METHODS.each do |method|
      define_method(method) do |url, args = {}, &block|
        begin
          response = @conn.__send__(method, url, args)
        rescue Faraday::ClientError, Faraday::ServerError => e
          Failure APIConnectionError.faraday_error(e)
        end
        payload = handle_response(response)
        block.call(payload, response.headers) if block
        payload
      end
    end

    def handle_response(response)
      case response.status
      when 200..299
        Success response.body
      else
        Failure Error.from_response(response.status, response.body, response.headers)
      end
    end
  end
end
