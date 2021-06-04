module TreasuryPrime
  class Client
    module AccountMethods
      def get_account(id:)
        wrap_response(Account) do
          get("account/#{id}")
        end
      end
    end
  end
end
