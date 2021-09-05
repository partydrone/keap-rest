module Infusionsoft
  module REST
    class TagsResource < Resource
      def list(**params)
        response = get_request("tags", params: params)
        Collection.from_response(response, key: "tags", type: Tag)
      end

      def get(tag_id)
        Tag.new get_request("tags/#{tag_id}").body
      end
      alias_method :retrieve, :get

      def create(**attributes)
        Tag.new post_request("tags", body: attributes).body
      end

      def companies(tag_id, **params)
        response = get_request("tags/#{tag_id}/companies")
        Collection.from_response(response, key: "companies", type: Company)
      end
      alias_method :list_companies, :companies

      def remove_from_contacts(tag_id, **attributes)
        delete_request("tags/#{tag_id}/contacts", body: attributes)
      end

      def contacts(tag_id, **params)
        response = get_request("tags/#{tag_id}/contacts")
        Collection.from_response(response, key: "contacts", type: Contact)
      end
      alias_method :list_contacts, :contacts

      def add_to_contacts(tag_id, **attributes)
        response = post_request("tags/#{tag_id}/contacts", body: attributes)
        response.body.map { |result| Object.new result }
      end
      alias_method :apply_to_contacts, :add_to_contacts

      def remove_from_contact(tag_id, contact_id)
        delete_request("tags/#{tag_id}/contacts/#{contact_id}")
      end

      def create_category(**attributes)
        TagCategory.new post_request("tags/categories", body: attributes).body
      end
    end
  end
end
