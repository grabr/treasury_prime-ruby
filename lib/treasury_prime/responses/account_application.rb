module TreasuryPrime
  class AccountApplication < Response
    attribute :account_id                   , Types::String.optional
    attribute :account_number               , Types::String.optional
    attribute :bankdata                     , Types::Hash.optional
    attribute :business_application_id      , Types::Nil
    attribute :deposit_id                   , Types::String.optional
    attribute :created_at                   , Types::JSON::DateTime
    attribute :id                           , Types::String
    attribute :ownership_type               , Types::String
    attribute :person_applications          , Types::Array
    attribute :primary_person_application_id, Types::String
    attribute :status                       , Types::String
    attribute :product                      , Types::String
    attribute :updated_at                   , Types::JSON::DateTime
    attribute :userdata                     , Types::Hash.optional
  end
end
