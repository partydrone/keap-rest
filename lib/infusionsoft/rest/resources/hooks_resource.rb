module Infusionsoft
  module REST
    class HooksResource < Resource
      def keys
        get_request("hooks/event_keys").body
      end
      alias_method :event_keys, :keys
      alias_method :event_types, :keys
      alias_method :events, :keys
      alias_method :types, :keys

      def list
        response = get_request("hooks")
        response.body.map { |subscription| HookSubscription.new subscription }
      end
      alias_method :subscriptions, :list

      def get(key)
        HookSubscription.new get_request("hooks/#{key}")
      end
      alias_method :subscription, :get
      alias_method :retrieve, :get
      alias_method :get_subscription, :get
      alias_method :retrieve_subscription, :get

      def create(**attributes)
        HookSubscription.new post_request("hooks", body: attributes).body
      end
      alias_method :create_subscription, :create

      def update(key, **attributes)
        HookSubscription.new put_request("hooks/#{key}", body: attributes).body
      end
      alias_method :create_subscription, :create

      def delete(key)
        delete_request("hooks/#{key}")
      end
      alias_method :delete_subscription, :delete

      def verify(key)
        HookSubscription.new post_request("hooks/#{key}/verify").body
      end
      alias_method :verify_subscription, :verify

      def delayed_verify(key)
        HookSubscription.new post_request("hooks/#{key}/delayedVerify").body
      end
      alias_method :delayed_verify_subscription, :delayed_verify
    end
  end
end
