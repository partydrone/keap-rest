module Infusionsoft
  module REST
    class Client
      module Orders
        def orders(**params)
          response = get("orders", params: params)
          Collection.from_response(response, key: "orders", type: Order)
        end
        alias_method :list_orders, :orders

        def order(order_id)
          Order.new get("orders/#{order_id}").body
        end
        alias_method :retrieve_order, :order

        def create_order(**attributes)
          Order.new post("orders", body: attributes).body
        end

        def delete_order(order_id)
          delete("orders/#{order_id}").body
        end

        def create_order_item(order_id, **attributes)
          OrderItem.new post("orders/#{order_id}/items", body: attributes).body
        end

        def delete_order_item(order_id, order_item_id)
          delete("orders/#{order_id}/items/#{order_item_id}").body
        end

        def replace_order_pay_plan(order_id, **attributes)
          OrderPayPlan.new put("orders/#{order_id}/paymentPlan").body
        end

        def retrieve_order_payments(order_id)
          response = get("orders/#{order_id}/payments")
          response.body.map { |payment| OrderPayment.new payment }
        end

        def create_order_payment(order_id, **attributes)
          OrderPayment.new post("orders/#{order_id}/payments", body: attributes).body
        end

        def retrieve_order_transactions(order_id)
          response = get("orders/#{order_id}/transactions")
          Collection.from_response(response, key: "transactions", type: OrderTransaction)
        end

        def order_model
          Object.new get("orders/model").body
        end
      end
    end
  end
end
