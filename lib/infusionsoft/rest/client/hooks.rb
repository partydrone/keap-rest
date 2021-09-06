module Infusionsoft
  module REST
    class Client
      module Hooks
        def hook_event_types
          get("hooks/event_keys").body
        end
        alias_method :list_hook_event_types, :hook_event_types

        def hooks
          response = get("hooks")
          response.body.map { |subscription| HookSubscription.new subscription }
        end
        alias_method :list_hooks, :hooks
        alias_method :hook_subscriptions, :hooks
        alias_method :list_hook_subscriptions, :hooks

        def hook(key)
          HookSubscription.new get("hooks/#{key}")
        end
        alias_method :hook_subscription, :hook
        alias_method :retrieve_hook, :hook
        alias_method :retrieve_hook_subscription, :hook

        def create_hook(**attributes)
          HookSubscription.new post("hooks", body: attributes).body
        end
        alias_method :create_hook_subscription, :create_hook

        def update_hook(key, **attributes)
          HookSubscription.new put("hooks/#{key}", body: attributes).body
        end
        alias_method :update_hook_subscription, :update_hook

        def delete_hook(key)
          delete("hooks/#{key}")
        end
        alias_method :delete_hook_subscription, :delete_hook

        def verify_hook(key)
          HookSubscription.new post("hooks/#{key}/verify").body
        end
        alias_method :verify_hook_subscription, :verify_hook

        def delayed_verify_hook(key)
          HookSubscription.new post("hooks/#{key}/delayedVerify").body
        end
        alias_method :delayed_verify_hook_subscription, :delayed_verify_hook
        alias_method :verify_hook_delayed, :delayed_verify_hook
        alias_method :verify_hook_subscription_delayed, :delayed_verify_hook
      end
    end
  end
end
