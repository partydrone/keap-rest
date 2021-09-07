module Keap
  module REST
    class Client
      module Merchants
        def merchants
          MerchantsCollection.from_response get("merchants")
        end
        alias_method :list_merchants, :merchants
      end
    end
  end
end
