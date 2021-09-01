module Infusionsoft
  module REST
    class OrdersResource < Resource
      def list(**params)
        response = get_request("orders", params: params)
        Collection.from_response(response, key: "orders", type: Order)
      end

      def get(order_id)
        Order.new get_request("orders/#{order_id}").body
      end
      alias_method :retrieve, :get

      def create(**attributes)
        Order.new post_request("orders", body: attributes).body
      end

      def delete(order_id)
        delete_request("orders/#{order_id}")
      end

      def create_item(order_id, **attributes)
        OrderItem.new post_request("orders/#{order_id}/items", body: attributes).body
      end

      def delete_item(order_id, order_item_id)
        delete_request("orders/#{order_id}/items/#{order_item_id}")
      end

      def replace_pay_plan(order_id, **attributes)
        OrderPayPlan.new put_request("orders/#{order_id}/paymentPlan").body
      end

      def get_payments(order_id)
        # NOTE: This one is tricky because it returns an array of un-labeled
        # results—results without a key—which makes it difficult to wrap each
        # item in the array in a Ruby object.
        response = get_request("orders/#{order_id}/payments")
        response.body.map |payment|
          OpenStruct.new payment
        end
      end
    end
  end
end
