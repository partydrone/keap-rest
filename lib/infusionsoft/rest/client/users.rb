module Infusionsoft
  module REST
    class Client
      module Users
        def users(**params)
          response = get("users", params: params)
          Collection.from_request(response, key: "users", type: User)
        end
        alias_method :list_users, :users

        def create_user(**attributes)
          User.new post("users", body: attributes).body
        end

        def user_signature(user_id)
          get("users/#{user_id}/signature").body
        end
        alias_method :user_email_signature, :user_signature
      end
    end
  end
end
