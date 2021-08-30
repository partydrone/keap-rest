module Infusionsoft
  module REST
    class Contact < Object
      def first_name
        given_name
      end

      def last_name
        family_name
      end

      def full_name
        [given_name, middle_name, family_name].join(" ").squeeze(" ")
      end

      def name
        [given_name, family_name].join(" ").squeeze(" ")
      end

      def email
        email_addresses.find { |e| e.field == "EMAIL1" }.email
      end
    end
  end
end
