module TreasuryPrime
  class Client
    module AccountApplicationMethods
      def create_account_application(person_application_id:, product: :personal_savings)
        wrap_response(AccountApplication) do
          post("apply/account_application", { 
            primary_person_application_id: person_application_id,
            product: product
          })
        end
      end

      def get_account_application(id:)
        wrap_response(AccountApplication) do
          get("apply/account_application/#{id}")
        end
      end
    end
  end
end
