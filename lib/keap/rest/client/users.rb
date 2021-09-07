module Keap
  module REST
    class Client
      module Users
        def users(**params)
          response = get("users", params: params)
          Collection.from_response(response, key: "users", type: User)
        end
        alias_method :list_users, :users

        def create_user(**attributes)
          User.new post("users", body: attributes).body
        end

        def user_signature(user_id)
          get("users/#{user_id}/signature", headers: {Accept: "text/html"}).body
        end
        alias_method :user_email_signature, :user_signature
      end
    end
  end
end
