module Infusionsoft
  module REST
    class LocaleResource < Resource
      def countries
        get_request("locales/countries").body['countries']
      end

      def provinces(country_code)
        get_request("locales/countries/#{country_code}/provinces").body['provinces']
      end
    end
  end
end
