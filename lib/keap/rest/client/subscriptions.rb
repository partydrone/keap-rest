module Keap
  module REST
    class Client
      module Subscriptions
        def subscriptions(**params)
          response = get("subscriptions", params: params)
          Collection.from_response(response, key: "subscriptions", type: Subscription)
        end
        alias_method :list_subscriptions, :subscriptions

        def create_subscription(**attributes)
          Subscription.new post("subscriptions", body: attributes).body
        end

        def subscription_model
          Object.new get("subscriptions/model").body
        end
      end
    end
  end
end
