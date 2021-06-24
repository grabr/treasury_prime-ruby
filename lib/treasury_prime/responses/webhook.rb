module TreasuryPrime
  class Webhook < Response
    attribute :id              , Types::String
    attribute :created_at      , Types::JSON::DateTime
    attribute :updated_at      , Types::JSON::DateTime
    attribute :event           , Types::String
    attribute :url             , Types::String
  end
end
