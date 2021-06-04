module TreasuryPrime
  class Client
    module CardMethods

      def create_card(account_id:, person_id:, card_product_id: )
        wrap_response(Card) do
          post("card", {account_id: account_id, person_id: person_id, card_product_id: card_product_id})
        end
      end

      def get_card(id:)
        wrap_response(Card) do
          get("card/#{id}")
        end
      end
    end
  end
end
