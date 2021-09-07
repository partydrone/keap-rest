module Keap
  module REST
    class MerchantsCollection
      attr_reader :data, :default_merchant_account

      class << self
        def from_response(response)
          body = response.body

          new(
            data: body["merchant_accounts"].map { |attrs| Keap::REST::MerchantAccount.new attrs },
            default_merchant_account: body.dig("default_merchant_account")
          )
        end
      end

      def initialize(data:, default_merchant_account:)
        @data = data
        @default_merchant_account = default_merchant_account
      end
    end
  end
end
