require "base64"

module Keap
  module REST
    class Token
      attr_reader :access_token, :refresh_token, :expires_in, :expires_at

      class << self
        def auth_url
          params = {
            client_id: Keap::REST.client_id,
            redirect_uri: Keap::REST.redirect_uri,
            response_type: "code",
            scope: "full"
          }

          uri = URI(Keap::REST.authorize_url)
          uri = URI::HTTPS.build(host: uri.host, path: uri.path, query: URI.encode_www_form(params))
          uri.to_s
        end

        def request(code:)
          body = {
            client_id: Keap::REST.client_id,
            client_secret: Keap::REST.client_secret,
            code: code,
            grant_type: "authorization_code",
            redirect_uri: Keap::REST.redirect_uri
          }

          response = connection.post do |req|
            req.body = body
          end

          new(response.body)
        end

        def refresh(refresh_token:)
          body = {
            grant_type: "refresh_token",
            refresh_token: refresh_token
          }

          response = connection.post do |req|
            req.headers["Authorization"] = "Basic #{Base64.strict_encode64(Keap::REST.client_id + ":" + Keap::REST.client_secret)}"
            req.body = body
          end

          new(response.body)
        end

        private

        def connection
          @connection ||= Faraday.new(Keap::REST.token_url) do |http|
            http.headers[:user_agent] = Keap::REST.user_agent

            http.request :url_encoded

            http.response :json
            http.response :logger, nil, {headers: true, body: true}

            http.adapter Keap::REST.adapter
          end
        end
      end

      def initialize(options = {})
        [:access_token, :refresh_token, :expires_in].each do |arg|
          instance_variable_set("@#{arg}", options.delete(arg) || options.delete(arg.to_s))
        end

        @expires_at = Time.now + expires_in if expires_in
      end

      def expires?
        !!@expires_at
      end

      def expired?
        expires? && (Time.now > expires_at)
      end
    end
  end
end
