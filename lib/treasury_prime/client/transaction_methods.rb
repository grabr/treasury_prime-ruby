module TreasuryPrime
  class Client
    module TransactionMethods
      # TODO: move pagination to module

      def get_transactions(account_id:, page_cursor: nil, page_size: nil)
        wrap_response(Transaction) do
          get(
            "/account/#{account_id}/transaction",
            {}.tap do |args|
              args[:page_cursor] = page_cursor if page_cursor
              args[:page_size] = page_size if page_size
            end
          )
        end
      end
    end
  end
end
