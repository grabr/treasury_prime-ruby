module TreasuryPrime
  RSpec.describe Client::PersonMethods do
    include_context :api_variables

    describe "#get_person" do
      subject do
        client.get_person(id: person_id)
      end

      let(:person_id) { "psn_11gbjqeg2kxkgv" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :get_person_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(Person)
        end
      end
    end
  end
end
