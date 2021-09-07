module Keap
  module REST
    class Client
      module Campaigns
        def campaigns(**params)
          response = get("campaigns", params: params)
          Collection.from_response(response, key: "campaigns", type: Campaign)
        end
        alias_method :list_campaigns, :campaigns

        def campaign(campaign_id)
          Campaign.new get("campaigns/#{campaign_id}").body
        end
        alias_method :retrieve_campaign, :campaign

        def add_contacts_to_campaign_sequence(campaign_id, sequence_id)
          post("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts").body
        end

        def delete_contacts_from_campaign_sequence(campaign_id, sequence_id)
          delete("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts").body
        end

        def add_contact_to_campaign_sequence(campaign_id, sequence_id, contact_id)
          post("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts/#{contact_id}").body
        end

        def delete_contact_from_campaign_sequence(campaign_id, sequence_id, contact_id)
          delete("campaigns/#{campaign_id}/sequences/#{sequence_id}/contacts/#{contact_id}").body
        end

        def achieve_campaign_api_goal(integration, call_name, **attributes)
          post("campaigns/#{integration}/#{call_name}", body: attributes).body
        end
      end
    end
  end
end
