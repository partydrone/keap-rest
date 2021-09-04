module Infusionsoft
  module REST
    class EmailsResource < Resource
      def list(**params)
        response = get_request("emails", params: params)
        Collection.from_response(response, key: "emails", type: Email)
      end

      def get(email_id)
        Email.new get_request("emails/#{email_id}").body
      end
      alias_method :retrieve, :get

      def create(**attributes)
        Email.new post_request("emails", body: attributes).body
      end

      def delete(email_id)
        delete_request("emails/#{email_id}")
      end

      def update(email_id, **attributes)
        Email.new put_request("emails/#{email_id}", body: attributes).body
      end

      def queue(**attributes)
        post_request("emails/queue", body: attributes)
      end
      alias_method :send, :queue

      def sync(**attributes)
        response = post_request("emails/sync", body: attributes)
        Collection.from_response(response, key: "emails", type: Email)
      end
      alias_method :create_multiple, :sync
      alias_method :create_set, :sync

      def unsync(**attributes)
        Object.new post_request("emails/unsync", body: attributes).body
      end
    end
  end
end
