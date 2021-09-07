module Keap
  module REST
    class Client
      module Products
        def products(**params)
          response = get("products", params: params)
          Collection.from_response(response, key: "products", type: Product)
        end
        alias_method :list_products, :products

        def product(product_id, **params)
          Product.new get("products/#{product_id}", params: params).body
        end
        alias_method :retrieve_product, :product

        def create_product(**attributes)
          Product.new post("products", body: attributes).body
        end

        def update_product(product_id, **attributes)
          Product.new patch("products/#{product_id}", body: attributes).body
        end

        def delete_product(product_id)
          delete("products/#{product_id}").body
        end

        def delete_product_image(product_id)
          delete("products/#{product_id}/image").body
        end

        def upload_product_image(product_id, **attributes)
          post("products/#{product_id}/image", body: attributes).body
        end

        def retrieve_product_subscription(product_id, subscription_id)
          ProductSubscription.new get("products/#{product_id}/subscriptions/#{subscription_id}").body
        end

        def create_product_subscription(product_id, **attributes)
          ProductSubscription.new post("products/#{product_id}/subscription", body: attributes).body
        end

        def delete_product_subscription(product_id, subscription_id)
          delete("products/#{product_id}/subscriptions/#{subscription_id}").body
        end

        # @deprecated
        def synced_products(**params)
          response = get("products/sync", params: params)
          Collection.from_response(response, key: "product_statuses", type: Product)
        end
        alias_method :retrieve_synced_products, :synced_products
      end
    end
  end
end
