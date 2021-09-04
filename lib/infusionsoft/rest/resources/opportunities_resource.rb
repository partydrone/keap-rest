module Infusionsoft
  module REST
    class OpportunitiesResource < Resource
      def list(**params)
        response = get_request("opportunities", params: params)
        Collection.from_response(response, key: "opportunities", type: Opportunity)
      end

      def get(opportunity_id, **params)
        Opportunity.new get_request("opportunities/#{opportunity_id}", params: params).body
      end
      alias_method :retrieve, :get

      def create(**attributes)
        Opportunity.new post_request("opportunities", body: attributes).body
      end

      def update(opportunity_id, **attributes)
        Opportunity.new patch_request("opportunities/#{opportunity_id}", body: attributes).body
      end

      def replace(opportunity_id, **attributes)
        Opportunity.new put_request("opportunities/#{opportunity_id}", body: attributes).body
      end

      def model
        Object.new get_request("opportunities/model").body
      end

      def pipeline
        response = get_request("opportunity/stage_pipeline", body: attributes)
        response.body.map { |stage| Stage.new stage }
      end
      alias_method :stage_pipeline, :pipeline
    end
  end
end
