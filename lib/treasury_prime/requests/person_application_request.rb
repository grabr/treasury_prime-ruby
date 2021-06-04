module TreasuryPrime
  class PersonApplicationRequest < ::TreasuryPrime::Request
    attribute :citizenship, Types::String
    attribute :date_of_birth, Types::Date
    attribute :email_address, Types::Email
    attribute :first_name, Types::String
    attribute :last_name, Types::String
    attribute :phone_number, Types::String
    attribute :physical_address, Types::Address
  end
end
