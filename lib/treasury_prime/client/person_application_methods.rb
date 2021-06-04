module TreasuryPrime
  module Client::PersonApplicationMethods
    def create_person_application(request)
      wrap_response(PersonApplication) do
        post("apply/person_application", request.to_params)
      end
    end
  end
end
