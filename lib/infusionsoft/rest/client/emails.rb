module Infusionsoft
  module REST
    class Client
      module Emails
        def emails(**params)
          response = get("emails", params: params)
          Collection.from_response(response, key: "emails", type: Email)
        end
        alias_method :list_emails, :emails

        def email(email_id)
          Email.new get("emails/#{email_id}").body
        end
        alias_method :retrieve_email, :email

        def create_email(**attributes)
          Email.new post("emails", body: attributes).body
        end

        def delete_email(email_id)
          delete("emails/#{email_id}")
        end

        def update_email(email_id, **attributes)
          Email.new put("emails/#{email_id}", body: attributes).body
        end

        def queue_email(**attributes)
          post("emails/queue", body: attributes)
        end
        alias_method :send_email, :queue_email

        def sync_emails(**attributes)
          response = post("emails/sync", body: attributes)
          Collection.from_response(response, key: "emails", type: Email)
        end
        alias_method :create_emails, :sync_emails

        def unsync_emails(**attributes)
          Object.new post("emails/unsync", body: attributes).body
        end
      end
    end
  end
end
