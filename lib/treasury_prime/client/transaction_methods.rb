module TreasuryPrime
  class Client
    module TransactionMethods
      def get_transactions(account_id:)
        wrap_response(Transaction) do
          get("/account/#{account_id}/transaction")
        end
      end
    end
  end
end
