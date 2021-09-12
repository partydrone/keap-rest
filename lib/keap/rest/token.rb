require "base64"
require "time"

module Keap
  module REST
    # Object used for managing OAuth2 tokens for the Keap REST API.
    #
    class Token
      # @return [String] The access token returned by the API.
      attr_reader :access_token
      # @return [String] The refresh token needed to request a new access token.
      attr_reader :refresh_token
      # @return [Integer] Number of seconds from when the access token was
      #   issued before it expires.
      attr_reader :expires_in
      # @return [Time] Date and time when the access token expires.
      attr_reader :expires_at

      class << self
        # Generate a URL for initiating an authorization request.
        #
        # @param redirect_uri [String] The callback URL Keap will redirect to
        #   after authorization.
        #
        # @return [String] A fully-configured authorization URL.
        #
        def auth_url(redirect_uri: Keap::REST.redirect_uri)
          params = {
            client_id: Keap::REST.client_id,
            redirect_uri: redirect_uri,
            response_type: "code",
            scope: "full"
          }

          uri = URI(Keap::REST.authorize_url)
          uri = URI::HTTPS.build(host: uri.host, path: uri.path, query: URI.encode_www_form(params))
          uri.to_s
        end

        # Request a new access token.
        #
        # @param code [String] An authorization code received from a successful
        #   authorization request.
        # @param redirect_uri [String] The redirect_uri used in the initial
        #   authorization request.
        #
        # @return [Token] A new instance of a token object.
        #
        def request(code:, redirect_uri: Keap::REST.redirect_uri)
          body = {
            client_id: Keap::REST.client_id,
            client_secret: Keap::REST.client_secret,
            code: code,
            grant_type: "authorization_code",
            redirect_uri: redirect_uri
          }

          response = connection.post do |req|
            req.body = body
          end

          new(response.body)
        end

        # Refresh the current access token.
        #
        # @param refresh_token [String] The refresh token provided when the most
        #   recent `access_token` was granted.
        #
        # @return [Token] A new instance of a token object.
        #
        def refresh(refresh_token:)
          body = {
            grant_type: "refresh_token",
            refresh_token: refresh_token
          }

          response = connection.post do |req|
            req.headers["Authorization"] = "Basic " + Base64.strict_encode64(Keap::REST.client_id + ":" + Keap::REST.client_secret)
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
        [:access_token, :refresh_token, :expires_in, :expires_at].each do |arg|
          instance_variable_set("@#{arg}", options.delete(arg) || options.delete(arg.to_s))
        end

        @expires_at &&= convert_expires_at(@expires_at)
        @expires_at ||= Time.now + expires_in if expires_in
      end

      # Indicate if the access token expires.
      #
      # @return [Boolean]
      #
      def expires?
        !!@expires_at
      end

      # Indicate if the access token is still valid.
      #
      # @return [Boolean]
      #
      def expired?
        expires? && (Time.now > expires_at)
      end

      # Convert token into a hash which can be used to create a new instance
      #   with `Token.new`.
      #
      # @return [Hash] A hash of Token property values.
      #
      def to_hash
        {
          access_token: access_token,
          refresh_token: refresh_token,
          expires_in: expires_in,
          expires_at: expires_at.iso8601
        }
      end

      private

      def convert_expires_at(str)
        Time.iso8601(str)
      rescue ArgumentError
        str
      end
    end
  end
end
