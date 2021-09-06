module Infusionsoft
  module REST
    class Client
      module Merchants
        def merchants
          response = get("merchants")
          Collection.from_response(response, key: "merchant_accounts", type: Merchant)
          # TODO: Create a new collection class (?) since the response is not a
          # paginated collection and has custom attributes.
        end
        alias_method :list_merchants, :merchants
      end
    end
  end
end
