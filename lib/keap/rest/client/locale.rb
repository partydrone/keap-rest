module Keap
  module REST
    class Client
      module Locale
        def locale_countries
          get("locales/countries").body["countries"]
        end
        alias_method :countries, :locale_countries

        def locale_provinces(country_code)
          get("locales/countries/#{country_code}/provinces").body["provinces"]
        end
        alias_method :provinces, :locale_provinces
      end
    end
  end
end
