module Infusionsoft
  module REST
    class Client
      module Contacts
        def contacts(**params)
          response = get("contacts", params: params)
          Collection.from_response(response, key: "contacts", type: Contact)
        end
        alias_method :list_contacts, :contacts

        def contact(contact_id)
          Contact.new get("contacts/#{contact_id}").body
        end
        alias_method :retrieve_contact, :contact

        def create_contact(**attributes)
          Contact.new post("contacts", body: attributes).body
        end

        def create_or_update_contact(duplicate_option: "Email", **attributes)
          Contact.new put("contacts", body: attributes.merge(duplicate_option: duplicate_option)).body
        end

        def update_contact(contact_id, params, **attributes)
          Contact.new patch("contacts/#{contact_id}", params: params, body: attributes).body
        end

        def delete_contact(contact_id)
          delete("contacts/#{contact_id}")
        end

        def contact_credit_cards(contact_id)
          response = get("contacts/#{contact_id}/creditCards")
          response.body.map { |card| CreditCard.new card }
        end
        alias_method :retrieve_contact_credit_cards, :contact_credit_cards

        def create_contact_credit_card(contact_id, **attributes)
          CreditCard.new post_response("contacts/#{contact_id}/creditCards", body: attributes).body
        end

        def contact_emails(contact_id, **params)
          response = get("contacts/#{contact_id}/emails", params: params)
          Collection.from_response(response, key: "emails", type: Email)
        end
        alias_method :list_contact_emails, :contact_emails

        def create_contact_email(contact_id, **attributes)
          Email.new post("contacts/#{contact_id}/emails", body: attributes).body
        end

        def contact_tags(contact_id, **params)
          response = get("contacts/#{contact_id}/tags", params: params)
          Collection.from_response(response, key: "tags", type: Tag)
        end
        alias_method :list_contact_tags, :contact_tags

        def apply_contact_tags(contact_id, **attributes)
          post("contacts/#{contact_id}/tags", body: attributes).body
        end

        def remove_contact_tags(contact_id, **params)
          delete("contacts/#{contact_id}/tags", params: params)
        end

        def remove_contact_tag(contact_id, tag_id)
          delete("contacts/#{contact_id}/tags/#{tag_id}")
        end

        def contact_model
          OpenStruct.new get("contacts/model").body
        end

        def create_contact_custom_field(**attributes)
          OpenStruct.new post("contacts/model/customFields", body: attributes).body
        end
      end
    end
  end
end
