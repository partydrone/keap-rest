module Infusionsoft
  module REST
    class Client
      module UserInfo
        def user_info
          Infusionsoft::REST::UserInfo.new get("oauth/connect/userinfo").body
        end
        alias_method :retrieve_user_info, :user_info
      end
    end
  end
end
