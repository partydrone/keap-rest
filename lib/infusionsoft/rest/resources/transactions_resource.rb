module Infusionsoft
  module REST
    class TransactionsResource < Resource
      def list(**params)
        response = get_request("transactions", params: params)
        Collection.from_response(response, key: "transactions", type: Transaction)
      end

      def get(transaction_id)
        Transaction.new get_request("transactions/#{transaction_id}").body
      end
      alias_method :retrieve, :get
    end
  end
end
