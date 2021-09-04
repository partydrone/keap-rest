module Infusionsoft
  module REST
    class MerchantsResource < Resource
      def list
        response = get_request("merchants")
        Collection.from_response(response, key: "merchant_accounts", type: Merchant)
        # TODO: Create a new collection class (?) since the response is not a
        # paginated collection and has custom attributes.
      end
    end
  end
end
