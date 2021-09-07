module Keap
  module REST
    class Client
      module EmailAddresses
        def replace_email_address(email, **attributes)
          EmailAddress.new put("emailAddresses/#{email}", body: attributes).body
        end
      end
    end
  end
end
