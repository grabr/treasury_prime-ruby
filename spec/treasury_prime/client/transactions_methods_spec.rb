module TreasuryPrime
  RSpec.describe Client::PersonMethods do
    include_context :api_variables

    describe "#get_person" do
      subject do
        client.get_transactions(account_id: account_id)
      end

      let(:account_id) { "acct_11gbjqeg2kxkgs" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :get_transactions_success } do
          expect(subject).to be_success
          expect(subject.success).to all(be_a(Transaction))
        end
      end
    end
  end
end
