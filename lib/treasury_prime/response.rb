module TreasuryPrime
  # require "hashie/mash"

  # class Response < Hashie::Mash
  #   disable_warnings
  # end

  class Response < Dry::Struct
    schema schema.strict
    transform_keys(&:to_sym)
  end
end
