module TreasuryPrime
  class Request < Dry::Struct
    schema schema.strict
    transform_keys(&:to_sym)

    def to_params
      to_h.compact
    end
  end
end
