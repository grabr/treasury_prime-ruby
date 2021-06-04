module TreasuryPrime
  class Client
    module CardProductMethods
      def get_card_products
        wrap_response(CardProduct) do
          get("cardproduct")
        end
      end
    end
  end
end
