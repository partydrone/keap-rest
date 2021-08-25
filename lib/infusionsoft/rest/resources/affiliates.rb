module Infusionsoft
  module REST
    class AffiliatesResource < Resource
      def list(**params)
        response = get_request("affiliates", params: params)
        Collection.from_response(response, key: "affiliates", type: Affiliate)
      end

      def get(affiliate_id)
        Affiliate.new get_request("affiliates/#{affiliate_id}", params: params).body
      end
    end
  end
end
