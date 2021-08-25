module Infusionsoft
  module REST
    class ContactsResource < Resource
      def list(**params)
        response = get_request("contacts", params: params)
        Collection.from_response(response, key: "contacts", type: Contact)
      end

      def get(contact_id)
        Contact.new get_request("contacts/#{contact_id}").body
      end

      def create(**attributes)
        Contact.new post_request("contacts", body: attributes).body
      end

      def create_or_update(duplicate_option: 'Email', **attributes)
        Contact.new put_request("contacts", body: attributes.merge(duplicate_option: duplicate_option)).body
      end

      def update(contact_id, params, **attributes)
        Contact.new patch_request("contacts/#{contact_id}", params: params, body: attributes).body
      end

      def delete(contact_id)
        delete_request("contacts/#{contact_id}")
      end
    end
  end
end
