module TreasuryPrime
  class CardProduct < Response
    attribute :id                      , Types::String
    attribute :created_at              , Types::JSON::DateTime
    attribute :updated_at              , Types::JSON::DateTime

    attribute :card_back_image_file_id , Types::String.optional
    attribute :type                    , Types::String
    attribute :card_front_image_file_id, Types::String.optional
    attribute :status                  , Types::String
    attribute :userdata                , Types::Hash.optional
  end
end
