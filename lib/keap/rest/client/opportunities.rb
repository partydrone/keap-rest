module Keap
  module REST
    class Client
      module Opportunities
        def opportunities(**params)
          response = get("opportunities", params: params)
          Collection.from_response(response, key: "opportunities", type: Opportunity)
        end
        alias_method :list_opportunities, :opportunities

        def opportunity(opportunity_id, **params)
          Opportunity.new get("opportunities/#{opportunity_id}", params: params).body
        end
        alias_method :retrieve_opportunity, :opportunity

        def create_opportunity(**attributes)
          Opportunity.new post("opportunities", body: attributes).body
        end

        def update_opportunity(opportunity_id, **attributes)
          Opportunity.new patch("opportunities/#{opportunity_id}", body: attributes).body
        end

        def replace_opportunity(opportunity_id, **attributes)
          Opportunity.new put("opportunities/#{opportunity_id}", body: attributes).body
        end

        def opportunity_model
          Object.new get("opportunities/model").body
        end

        def opportunity_pipeline
          response = get("opportunity/stage_pipeline", body: attributes)
          response.body.map { |stage| Stage.new stage }
        end
        alias_method :opportunity_stage_pipeline, :opportunity_pipeline
      end
    end
  end
end
