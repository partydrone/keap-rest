module Infusionsoft
  module REST
    class AccountResource < Resource
      def info
        Account.new get_request("account/profile").body
      end
      alias_method :get, :info

      def update(**attributes)
        Account.new put_request("account/profile", body: attributes).body
      end
    end
  end
end
