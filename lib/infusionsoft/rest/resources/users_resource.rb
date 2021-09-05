module Infusionsoft
  module REST
    class UsersResource < Resource
      def list(**params)
        response = get_request("users", params: params)
        Collection.from_request(response, key: "users", type: User)
      end

      def create_user(**attributes)
        User.new post_request("users", body: attributes).body
      end

      def signature(user_id)
        get_request("users/#{user_id}/signature").body
      end
      alias_method :email_signature, :signature
    end
  end
end
