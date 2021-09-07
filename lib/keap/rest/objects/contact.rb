module Keap
  module REST
    class Contact < Object
      def email
        email_addresses.find { |e| e.field == "EMAIL1" }.email
      end
    end
  end
end
