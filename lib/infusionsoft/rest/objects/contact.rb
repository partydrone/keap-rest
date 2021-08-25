require 'time'

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
        [given_name, middle_name, family_name].join(' ').squeeze(' ')
      end

      def name
        [given_name, family_name].join(' ').squeeze(' ')
      end

      def date_created
        Time.parse super
      end

      def last_updated
        Time.parse super
      end
    end
  end
end
