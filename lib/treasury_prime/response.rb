module TreasuryPrime
  class Response < Dry::Struct
    schema schema
    transform_keys(&:to_sym)
  end
end
