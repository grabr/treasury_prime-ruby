module TreasuryPrime
  RSpec.describe Client::AccountApplicationMethods do
    include_context :api_variables

    describe "#create_account_application" do
      subject do
        client.create_account_application(person_application_id: person_application_id)
      end

      let(:person_application_id) { "apsn_11gbjpyv2kxj6z" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :create_account_application_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(AccountApplication)
        end
      end

      context "with invalid params" do
        let(:person_application_id) { "unexistant" }
        it "fails", vcr: { cassette_name: :create_account_application_failure } do
          expect(subject).to be_failure
          expect(subject.failure).to be_a(Error::BadRequest)
        end
      end
    end

    describe "#get_account_application" do
      subject do
        client.get_account_application(id: application_id)
      end

      let(:application_id) { "aact_11gbjqe62kxkfp" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :get_account_application_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(AccountApplication)
        end
      end
    end
  end
end
