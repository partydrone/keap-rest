module Infusionsoft
  module REST
    class UserInfoResource < Resource
      def get
        UserInfo.new get_request("oauth/connect/userinfo").body
      end
      alias_method :retrieve, :get
    end
  end
end
