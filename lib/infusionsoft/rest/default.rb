require "infusionsoft/rest/version"

module Infusionsoft
  module REST
    module Default
      API_ENDPOINT = "https://api.infusionsoft.com/crm/rest/v1".freeze
      USER_AGENT = "Infusionsoft REST Ruby Gem #{Infusionsoft::REST::VERSION}".freeze

      class << self
        def options
          Infusionsoft::REST::Configurable.keys.map { |key| [key, send(key)] }.to_h
        end

        def access_token
          ENV["INFUSIONSOFT_REST_ACCESS_TOKEN"] || ENV["INFUSIONSOFT_ACCESS_TOKEN"]
        end

        def adapter
          Faraday.default_adapter
        end

        def api_endpoint
          ENV["INFUSIONSOFT_REST_API_ENDPOINT"] || API_ENDPOINT
        end

        def client_id
          ENV["INFUSIONSOFT_REST_CLIENT_ID"] || ENV["INFUSIONSOFT_CLIENT_ID"]
        end

        def client_secret
          ENV["INFUSIONSOFT_REST_CLIENT_SECRET"] || ENV["INFUSIONSOFT_CLIENT_SECRET"]
        end

        def redirect_uri
          ENV["INFUSIONSOFT_REST_REDIRECT_URI"] || ENV["INFUSIONSOFT_REDIRECT_URI"]
        end

        def stubs
        end

        def user_agent
          ENV["INFUSIONSOFT_REST_USER_AGENT"] || USER_AGENT
        end
      end
    end
  end
end
