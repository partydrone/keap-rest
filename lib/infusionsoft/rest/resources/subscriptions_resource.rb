module Infusionsoft
  module REST
    class SubscriptionsResource < Resource
      def list(**params)
        response = get_request("subscriptions", params: params)
        Collection.from_response(response, key: "subscriptions", type: Subscription)
      end

      def create(**attributes)
        Subscription.new post_request("subscriptions", body: attributes).body
      end

      def model
        Object.new get_request("subscriptions/model").body
      end
    end
  end
end
