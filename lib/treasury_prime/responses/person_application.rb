module TreasuryPrime
  class PersonApplication < Response
    attribute :bankdata               , Types::Hash.optional
    attribute :citizenship            , Types::String
    attribute :created_at             , Types::JSON::DateTime
    attribute :date_of_birth          , Types::JSON::Date
    attribute :email_address          , Types::Email
    attribute :secondary_email_address, Types::Email.optional
    attribute :mailing_address        , Types::String.optional
    attribute :first_name             , Types::String
    attribute :id                     , Types::String
    attribute :person_id              , Types::String.optional
    attribute :gov_id                 , Types::String.optional
    attribute :document_ids           , Types::Array.of(Types::String).optional
    attribute :user_id                , Types::String.optional
    attribute :last_name              , Types::String
    attribute :middle_name            , Types::String.optional
    attribute :occupation             , Types::String.optional
    attribute :phone_number           , Types::String
    attribute :physical_address       , Types::Address
    attribute :updated_at             , Types::JSON::DateTime
    attribute :userdata               , Types::Hash.optional
  end
end
