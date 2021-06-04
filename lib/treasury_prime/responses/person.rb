module TreasuryPrime
  class Person < Response
    attribute :id              , Types::String
    attribute :account_ids     , Types::Array.of(Types::String).constrained(size: 1)
    attribute :address         , Types::Address
    attribute :mailing_address , Types::Address.optional
    attribute :physical_address, Types::Address
    attribute :created_at      , Types::JSON::DateTime
    attribute :updated_at      , Types::JSON::DateTime
    attribute :email           , Types::Email
    attribute :first_name      , Types::String
    attribute :last_name       , Types::String
    attribute :middle_name     , Types::String.optional
    attribute :phone_number    , Types::String
    attribute :suffix          , Types::String.optional
    attribute :tin_last4       , Types::String
    attribute :bankdata        , Types::Hash.optional
  end
end
