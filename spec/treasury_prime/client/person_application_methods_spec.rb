module TreasuryPrime
  RSpec.describe Client::PersonApplicationMethods do
    include_context :api_variables

    describe "#create_person_application" do
      subject do
        client.create_person_application(PersonApplicationRequest.new(params))
      end

      let(:params) do
        {
          citizenship: country,
          date_of_birth: dob,
          email_address: "test@example.com",
          first_name: "John",
          last_name: "Doe",
          phone_number: "2025551111",
          physical_address: address
        }
      end

      let(:country) { "US" }
      let(:dob) { Date.parse "1932-02-22" }

      let(:address) do
        {
          street_line_1: "1600 Pennsylvania Ave",
          city: "Washington",
          state: "DC",
          postal_code: "20500"
        }
      end

      let(:json_body) { params.to_json }

      context "with valid request params" do
        # before do
        #   stub_request(:post, "https://api.sandbox.treasuryprime.com/person_application").
        #     with(body: json_body).
        #     to_return(status: 200, body: fixture("create_person_application/success.json"))
        # end
        it "succeeds", vcr: { cassette_name: :create_person_application_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(PersonApplication)
        end
      end

      context "with invalid params" do
        let(:dob) { Date.parse "1732-02-22" }
        # before do
        #   stub_request(:post, "https://api.sandbox.treasuryprime.com/person_application").
        #     with(body: json_body).
        #     to_return(status: 422, body: fixture("invalid_country.json"))
        # end
        it "fails", vcr: { cassette_name: :create_person_application_failure } do
          expect(subject).to be_failure
          expect(subject.failure).to be_a(Error::BadRequest)
        end
      end
    end
  end
end
