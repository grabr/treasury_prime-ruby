module TreasuryPrime
  RSpec.describe Client::WebhookMethods do
    include_context :api_variables

    describe "#create_webhook" do
      subject do
        client.create_webhook(event: "account.update", url: endpoint)
      end

      let(:endpoint) { "https://exapmle.com/notif" }

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :create_webhook_success } do
          expect(subject).to be_success
          expect(subject.success).to be_a(Webhook)
        end
      end
    end

    describe "#delete_webhook" do
      subject do
        client.delete_webhook(id: "wh_11gd6mt92pddye")
      end

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :delete_webhook_success } do
          expect(subject).to be_success
        end
      end
    end

    describe "#get_webhooks" do
      subject do
        client.get_webhooks
      end

      context "with valid request params" do
        it "succeeds", vcr: { cassette_name: :get_webhooks_success } do
          expect(subject).to be_success
          expect(subject.success).to all(be_a(Webhook))
        end
      end
    end
  end
end
