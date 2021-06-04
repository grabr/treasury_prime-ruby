module TreasuryPrime
  class Error < StandardError
    ClientError           = Class.new(self)
    ServerError           = Class.new(self)

    BadRequest            = Class.new(ClientError)
    Unauthorized          = Class.new(ClientError)
    Forbidden             = Class.new(ClientError)
    Conflict              = Class.new(ClientError)
    RequestEntityTooLarge = Class.new(ClientError)
    NotFound              = Class.new(ClientError)
    NotAcceptable         = Class.new(ClientError)
    UnprocessableEntity   = Class.new(ClientError)
    TooManyRequests       = Class.new(ClientError)

    InternalServerError   = Class.new(ServerError)
    BadGateway            = Class.new(ServerError)
    ServiceUnavailable    = Class.new(ServerError)
    GatewayTimeout        = Class.new(ServerError)

    def self.from_response(status, body, headers)
      message, _code, _attribute = parse_error(body)
      error_class(status).new(message)
    end

    def self.parse_error(body)
      [body["error"], nil]
    end

    def self.error_class(status)
      ERRORS[status]
    end
  end

  ERRORS = {
    400 => Error::BadRequest,
    401 => Error::Unauthorized,
    403 => Error::Forbidden,
    404 => Error::NotFound,
    406 => Error::NotAcceptable,
    413 => Error::RequestEntityTooLarge,
    422 => Error::UnprocessableEntity,
    409 => Error::Conflict,
    429 => Error::TooManyRequests,
    500 => Error::InternalServerError,
    502 => Error::BadGateway,
    503 => Error::ServiceUnavailable,
    504 => Error::GatewayTimeout,
  }.freeze
end
