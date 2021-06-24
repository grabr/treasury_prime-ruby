module TreasuryPrime
  class Client
    module WebhookMethods
      EVENTS = %w[
        account.update
        ach.create
        ach.update
        apply.account-application.create
        apply.account-application.update
        apply.business-application.create
        apply.business-application.update
        apply.deposit.create
        apply.parent-business.create
        apply.person-application.create
        apply.person.create
        billpay_payment.create
        billpay_payment.update
        billpay_rule.create
        billpay_rule.update
        book.create
        book.update
        business.update
        check_deposit.create
        check_deposit.update
        check_deposit_person.update
        counterparty.create
        counterparty.update
        file.create
        person.update
        webhook.create
        webhook.delete
        webhook.update
        wire.create
        wire.update
      ].freeze

      def create_webhook(event:, url:, basic_user: nil, basic_secret: nil)
        raise ArgumentError.new("Unknown event type #{event}") unless EVENTS.include?(event)
        wrap_response(Webhook) do
          post("webhook", {event: event, url: url, basic_user: basic_user, basic_secret: basic_secret})
        end
      end

      def get_webhooks
        wrap_response(Webhook) do
          get("webhook")
        end
      end

      def delete_webhook(id:)
        delete("webhook/#{id}")
      end
    end
  end
end
