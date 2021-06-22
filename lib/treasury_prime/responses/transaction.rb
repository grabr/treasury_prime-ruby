module TreasuryPrime
  class Transaction < Response
    attribute :id, Types::String
    attribute :ach_id, Types::String.optional
    attribute :amount, Types::Coercible::Float
    attribute :balance, Types::Coercible::Float
    attribute :book_id, Types::String.optional
    attribute :check_id, Types::String.optional
    attribute :check_number, Types::String.optional
    attribute :date, Types::JSON::DateTime
    attribute :desc, Types::String
    attribute :fingerprint, Types::String
    attribute :summary, Types::String.optional
    attribute :type, Types::String.optional
    attribute :wire, Types::String.optional
    attribute :wire_id, Types::String.optional
    attribute :type_source, Types::String.optional
    attribute :billpay_payment_id, Types::String.optional
  end
end
