module Infusionsoft
  module REST
    class CampaignsResource < Resource
      def list(**params)
        response = get_request("campaigns", params: params)
        Collection.from_response(response, key: "campaigns", type: Campaign)
      end

      def get(campaign_id)
        Campaign.new get_request("campaigns/#{campaign_id}").body
      end

      def add_contacts_to_sequence(campaign_id, sequence_id)
        post_request("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts")
      end

      def delete_contacts_from_sequence(campaign_id, sequence_id)
        delete_request("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts")
      end

      def add_contact_to_sequence(campaign_id, sequence_id, contact_id)
        post_request("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts/#{contact_id}")
      end

      def delete_contact_from_sequence(campaign_id, sequence_id, contact_id)
        delete_request("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts/#{contact_id}")
      end

      def achieve_api_goal(integration, call_name, **attributes)
        post_request("campaigns/#{integration}/#{call_name}", body: attributes).body
      end
    end
  end
end
