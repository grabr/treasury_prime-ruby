module TreasuryPrime
  class Client
    module CardMethods
      def create_card(**args)
        params = CardCreateRequest.new(**args).to_params

        wrap_response(Card) do
          post("card", params)
        end
      end

      def update_card(id:, **args)
        params = CardUpdateRequest.new(**args).to_params

        wrap_response(Card) do
          patch("card/#{id}", params)
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
