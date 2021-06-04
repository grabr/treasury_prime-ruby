module TreasuryPrime
  class Client
    module PersonMethods
      def get_person(id:)
        wrap_response(Person) do
          get("person/#{id}")
        end
      end
    end
  end
end
