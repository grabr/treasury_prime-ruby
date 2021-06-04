module TreasuryPrime
  module Types
    include Dry.Types()

    Address = Hash.schema(
      street_line_1: Types::String,
      street_line_2?: Types::String.optional,
      city: Types::String,
      state: Types::String,
      postal_code: Types::String
    ).with_key_transform(&:to_sym)

    Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    Currency = String.constrained(eql: "USD")

  end
end
