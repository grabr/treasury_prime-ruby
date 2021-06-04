module TreasuryPrime
  class Account < Response
    attribute :id               , Types::String
    attribute :account_number   , Types::String
    attribute :account_type     , Types::String
    attribute :address          , Types::Address
    attribute :available_balance, Types::Coercible::Float
    attribute :business_ids     , Types::Array.constrained(size: 0)
    attribute :created_at       , Types::JSON::DateTime
    attribute :currency         , Types::Currency
    attribute :current_balance  , Types::Coercible::Float
    attribute :name             , Types::String
    attribute :primary_person_id, Types::String
    attribute :person_ids       , Types::Array.of(Types::String).constrained(size: 1)
    attribute :routing_number   , Types::String
    attribute :status           , Types::String
    attribute :locked           , Types::Bool
    attribute :funded           , Types::Bool
    attribute :updated_at       , Types::JSON::DateTime
    attribute :userdata         , Types::Hash.optional
    attribute :bank_id          , Types::String
  end
end
