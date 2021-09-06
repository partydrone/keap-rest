module Infusionsoft
  module REST
    class Client
      module Transactions
        def transactions(**params)
          response = get("transactions", params: params)
          Collection.from_response(response, key: "transactions", type: Transaction)
        end
        alias_method :list_transactions, :transactions

        def transaction(transaction_id)
          Transaction.new get("transactions/#{transaction_id}").body
        end
        alias_method :retrieve_transaction, :transaction
      end
    end
  end
end
