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
        response = get_request("orders/#{order_id}/payments")
        response.body.map { |payment| OrderPayment.new payment }
      end
      alias_method :retrieve_payments, :get_payments

      def create_payment(order_id, **attributes)
        OrderPayment.new post_request("orders/#{order_id}/payments", body: attributes)
      end

      def get_transactions(order_id)
        response = get_request("orders/#{order_id}/transactions")
        Collection.from_response(response, key: "transactions", type: OrderTransaction)
      end
      alias_method :retrieve_transactions, :get_transactions

      def model
        Object.new get_request("orders/model").body
      end
    end
  end
end
