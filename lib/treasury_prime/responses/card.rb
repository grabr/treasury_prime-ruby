module TreasuryPrime
  class Card < Response
    attribute :id             , Types::String
    attribute :created_at     , Types::JSON::DateTime
    attribute :updated_at     , Types::JSON::DateTime

    attribute :status         , Types::String
    attribute :userdata       , Types::Hash.optional

    attribute :cvv            , Types::Nil
    attribute :account_id     , Types::String
    attribute :pan            , Types::String.optional
    attribute :expiration     , Types::String
    attribute :person_id      , Types::String
    attribute :last4          , Types::String
    attribute :card_product_id, Types::String
    attribute :pin_is_set     , Types::Bool
  end
end
