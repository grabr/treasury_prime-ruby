module TreasuryPrime
  class CardCreateRequest < ::TreasuryPrime::Request
    attribute :account_id, Types::String
    attribute :person_id, Types::String
    attribute :card_product_id, Types::String
    attribute? :pin, Types::String
    attribute? :status, Types::CardStatus
  end
end
