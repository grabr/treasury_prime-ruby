module TreasuryPrime
  RSpec.describe Client::AccountMethods do
    include_context :api_variables

    describe "#get_account" do
      subject do
        client.get_account(id: account_id)
      end

      let(:account_id) { "acct_11gbjqeg2kxkgs" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :get_account_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(Account)
        end
      end
    end
  end
end
