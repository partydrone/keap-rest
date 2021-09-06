module Infusionsoft
  module REST
    class Client
      module Tags
        def tags(**params)
          response = get("tags", params: params)
          Collection.from_response(response, key: "tags", type: Tag)
        end
        alias_method :list_tags, :tags

        def tag(tag_id)
          Tag.new get("tags/#{tag_id}").body
        end
        alias_method :retrieve_tag, :tag

        def create_tag(**attributes)
          Tag.new post("tags", body: attributes).body
        end

        def tag_companies(tag_id, **params)
          response = get("tags/#{tag_id}/companies")
          Collection.from_response(response, key: "companies", type: Company)
        end
        alias_method :list_tag_companies, :tag_companies

        def remove_tag_from_contacts(tag_id, **attributes)
          delete("tags/#{tag_id}/contacts", body: attributes)
        end

        def tag_contacts(tag_id, **params)
          response = get("tags/#{tag_id}/contacts")
          Collection.from_response(response, key: "contacts", type: Contact)
        end
        alias_method :list_tag_contacts, :tag_contacts

        def apply_tag_to_contacts(tag_id, **attributes)
          response = post("tags/#{tag_id}/contacts", body: attributes)
          response.body.map { |result| Object.new result }
        end

        def remove_tag_from_contact(tag_id, contact_id)
          delete("tags/#{tag_id}/contacts/#{contact_id}")
        end

        def create_tag_category(**attributes)
          TagCategory.new post("tags/categories", body: attributes).body
        end
      end
    end
  end
end
