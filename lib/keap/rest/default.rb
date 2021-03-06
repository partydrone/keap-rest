require "keap/rest/version"

module Keap
  module REST
    module Default
      API_ENDPOINT = "https://api.infusionsoft.com/crm/rest/v1".freeze
      AUTHORIZE_URL = "https://accounts.infusionsoft.com/app/oauth/authorize".freeze
      TOKEN_STORE = "Keap::REST::TokenStore".freeze
      TOKEN_URL = "https://api.infusionsoft.com/token".freeze
      USER_AGENT = "Keap REST Ruby Gem #{Keap::REST::VERSION}".freeze

      class << self
        def options
          Keap::REST::Configurable.keys.map { |key| [key, send(key)] }.to_h
        end

        def access_token
          ENV["KEAP_REST_ACCESS_TOKEN"] || ENV["KEAP_ACCESS_TOKEN"]
        end

        def adapter
          Faraday.default_adapter
        end

        def api_endpoint
          ENV["KEAP_REST_API_ENDPOINT"] || API_ENDPOINT
        end

        def authorize_url
          ENV["KEAP_REST_AUTHORIZE_URL"] || AUTHORIZE_URL
        end

        def client_id
          ENV["KEAP_REST_CLIENT_ID"] || ENV["KEAP_CLIENT_ID"]
        end

        def client_secret
          ENV["KEAP_REST_CLIENT_SECRET"] || ENV["KEAP_CLIENT_SECRET"]
        end

        def redirect_uri
          ENV["KEAP_REST_REDIRECT_URI"] || ENV["KEAP_REDIRECT_URI"]
        end

        def stubs
        end

        def token_store
          ENV["KEAP_REST_TOKEN_STORE"] || ENV["KEAP_TOKEN_STORE"] || TOKEN_STORE
        end

        def token_url
          ENV["KEAP_REST_TOKEN_URL"] || TOKEN_URL
        end

        def user_agent
          ENV["KEAP_REST_USER_AGENT"] || USER_AGENT
        end
      end
    end
  end
end
