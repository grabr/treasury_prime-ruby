module TreasuryPrime
  RSpec.describe Client::CardMethods do
    include_context :api_variables

    describe "#get_card_products" do
      subject do
        client.get_card_products
      end

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :get_card_products_success } do
          expect(subject).to be_success
          expect(subject.success).to all(be_a(CardProduct))
        end
      end
    end
  end
end
