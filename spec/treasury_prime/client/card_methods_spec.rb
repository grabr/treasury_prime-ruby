module TreasuryPrime
  RSpec.describe Client::CardMethods do
    include_context :api_variables

    describe "#create_card" do
      subject do
        client.create_card(
          account_id: account_id,
          person_id: person_id,
          card_product_id: card_product_id
        )
      end

      let(:account_id) { "acct_11gbjqeg2kxkgs" }
      let(:person_id) { "psn_11gbjqeg2kxkgv" }
      let(:card_product_id) { "cdpt_11ga8jrv2hfe90" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :create_card_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(Card)
        end
      end
    end

    describe "#get_card" do
      subject do
        client.get_card(id: card_id)
      end

      let(:card_id) { "card_11gbjw992ky5ht" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :get_card_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(Card)
        end
      end
    end
  end
end
