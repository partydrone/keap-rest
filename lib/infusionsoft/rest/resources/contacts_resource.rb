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
      alias_method :retrieve, :get

      def create(**attributes)
        Contact.new post_request("contacts", body: attributes).body
      end

      def create_or_update(duplicate_option: "Email", **attributes)
        Contact.new put_request("contacts", body: attributes.merge(duplicate_option: duplicate_option)).body
      end

      def update(contact_id, params, **attributes)
        Contact.new patch_request("contacts/#{contact_id}", params: params, body: attributes).body
      end

      def delete(contact_id)
        delete_request("contacts/#{contact_id}")
      end

      def credit_cards(contact_id)
        get_request("contacts/#{contact_id}/creditCards").body
      end
      alias_method :retrieve_credit_cards, :credit_cards

      def add_credit_card(contact_id, **attributes)
        CreditCard.new post_response("contacts/#{contact_id}/creditCards", body: attributes).body
      end
      alias_method :create_credit_card, :add_credit_card

      def emails(contact_id, **params)
        response = get_request("contacts/#{contact_id}/emails", params: params)
        Collection.from_response(response, key: "emails", type: Email)
      end
      alias_method :list_emails, :emails

      def add_email(contact_id, **attributes)
        Email.new post_request("contacts/#{contact_id}/emails", body: attributes).body
      end

      def tags(contact_id, **params)
        response = get_request("contacts/#{contact_id}/tags", params: params)
        Collection.from_response(response, key: "tags", type: Tag)
      end
      alias_method :list_tags, :tags

      def add_tags(contact_id, **attributes)
        post_request("contacts/#{contact_id}/tags", body: attributes).body
      end
      alias_method :apply_tags, :add_tags

      def remove_tags(contact_id, **params)
        delete_request("contacts/#{contact_id}/tags", params: params)
      end

      def remove_tag(contact_id, tag_id)
        delete_request("contacts/#{contact_id}/tags/#{tag_id}")
      end

      def model
        OpenStruct.new get_request("contacts/model").body
      end

      def create_custom_field(**attributes)
        OpenStruct.new post_request("contacts/model/customFields", body: attributes).body
      end
    end
  end
end
