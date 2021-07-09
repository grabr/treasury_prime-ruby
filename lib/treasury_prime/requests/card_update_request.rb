module TreasuryPrime
  class CardUpdateRequest < ::TreasuryPrime::Request
    attribute? :pin, Types::String
    attribute? :status, Types::CardStatus
  end
end
