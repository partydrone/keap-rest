module Infusionsoft
  module REST
    class AccountResource < Resource
      def info
        Account.new get_request("account/profile").body
      end
    end
  end
end
