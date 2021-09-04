module Infusionsoft
  module REST
    class ProductsResource < Resource
      def list(**params)
        response = get_request("products", params: params)
        Collection.from_response(response, key: "products", type: Product)
      end

      def get(product_id, **params)
        Product.new get_request("products/#{product_id}", params: params).body
      end
      alias_method :retrieve, :get

      def create(**attributes)
        Product.new post_request("products", body: attributes).body
      end

      def update(product_id, **attributes)
        Product.new patch_request("products/#{product_id}", body: attributes).body
      end

      def delete(product_id)
        delete_request("products/#{product_id}")
      end

      def delete_image(product_id)
        delete_request("products/#{product_id}/image")
      end

      def upload_image(product_id, **attributes)
        post_request("products/#{product_id}/image", body: attributes)
      end

      def get_subscription(product_id, subscription_id)
        ProductSubscription.new get_request("products/#{product_id}/subscriptions/#{subscription_id}").body
      end
      alias_method :retrieve_subscription, :get_subscription

      def create_subscription(product_id, **attributes)
        ProductSubscription.new post_request("products/#{product_id}/subscription", body: attributes).body
      end

      def delete_subscription(product_id, subscription_id)
        delete_request("products/#{product_id}/subscriptions/#{subscription_id}")
      end

      # WARNING: Deprecated
      def sync(**params)
        response = get_request("products/sync", params: params)
        Collection.from_response(response, key: "product_statuses", type: Product)
        # TODO: Create custom collection class that includes `sync_token`
        # at the root node.
      end
      alias_method :retrieve_synced, :sync
    end
  end
end
