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
      alias_method :retrieve

      def create(**attributes)
        Affiliate.new post_request("affiliates", body: attributes).body
      end

      def clawbacks(affiliate_id, **params)
        response = get_request("affiliates/#{affiliate_id}/clawbacks", params: params)
        Collection.from_response(response, key: "clawbacks", type: AffiliateClawback)
      end
      alias_method :list_clawbacks, :clawbacks

      def payments(affiliate_id, **params)
        response = get_request("affiliates/#{affiliate_id}/payments", params: params)
        Collection.from_response(response, key: "payments", type: AffiliatePayment)
      end
      alias_method :list_payments, :payments

      def commissions(**params)
        response = get_request("affiliates/commissions", params: params)
        Collection.from_response(response, key: "commissions", type: AffiliateCommission)
      end
      alias_method :list_commissions, :commissions

      def programs(**params)
        response = get_request("affiliates/programs", params: params)
        Collection.from_response(response, key: "programs", type: AffiliateProgram)
      end
      alias_method :list_programs, :programs

      def redirects(**params)
        response = get_request("affiliates/redirectlinks", params: params)
        Collection.from_response(response, key: "redirects", type: AffiliateRedirect)
      end
      alias_method :list_redirects, :redirects

      def summaries(**params)
        response = get_request("affiliates/summaries", params: params)
        Collection.from_response(response, key: "summaries", type: AffiliateSummary)
      end
      alias_method :list_summaries, :summaries

      def model
        OpenStruct.new get_request("affiliates/model").body
      end
    end
  end
end
