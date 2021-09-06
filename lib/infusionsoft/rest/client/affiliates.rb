module Infusionsoft
  module REST
    class Client
      module Affiliates
        def affiliates(**params)
          response = get("affiliates", params: params)
          Collection.from_response(response, key: "affiliates", type: Affiliate)
        end
        alias_method :list_affiliates, :affiliates

        def affiliate(affiliate_id)
          Affiliate.new get("affiliates/#{affiliate_id}", params: params).body
        end
        alias_method :retrieve_affiliate, :affiliate

        def create_affiliate(**attributes)
          Affiliate.new post("affiliates", body: attributes).body
        end

        def affiliate_clawbacks(affiliate_id, **params)
          response = get("affiliates/#{affiliate_id}/clawbacks", params: params)
          Collection.from_response(response, key: "clawbacks", type: AffiliateClawback)
        end
        alias_method :list_affiliate_clawbacks, :affiliate_clawbacks

        def affiliate_payments(affiliate_id, **params)
          response = get("affiliates/#{affiliate_id}/payments", params: params)
          Collection.from_response(response, key: "payments", type: AffiliatePayment)
        end
        alias_method :list_affiliate_payments, :affiliate_payments

        def affiliate_commissions(**params)
          response = get("affiliates/commissions", params: params)
          Collection.from_response(response, key: "commissions", type: AffiliateCommission)
        end
        alias_method :list_affiliate_commissions, :affiliate_commissions

        def affiliate_programs(**params)
          response = get("affiliates/programs", params: params)
          Collection.from_response(response, key: "programs", type: AffiliateProgram)
        end
        alias_method :list_affiliate_programs, :affiliate_programs

        def affiliate_redirects(**params)
          response = get("affiliates/redirectlinks", params: params)
          Collection.from_response(response, key: "redirects", type: AffiliateRedirect)
        end
        alias_method :list_affiliate_redirects, :affiliate_redirects

        def affiliate_summaries(**params)
          response = get("affiliates/summaries", params: params)
          Collection.from_response(response, key: "summaries", type: AffiliateSummary)
        end
        alias_method :list_affiliate_summaries, :affiliate_summaries

        def affiliate_model
          Object.new get("affiliates/model").body
        end
      end
    end
  end
end
