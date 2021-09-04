module Infusionsoft
  module REST
    class EmailAddressesResource < Resource
      def replace(email, **attributes)
        Object.new put_request("emailAddresses/#{email}", body: attributes).body
      end
    end
  end
end
