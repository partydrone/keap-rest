module Keap
  module REST
    module Configurable
      # @!attribute access_token
      #   @return [String] OAuth2 access token for authentication.
      # @!attribute adapter
      #   @return [Faraday::Adapter] HTTP library adapter.
      attr_accessor :access_token, :adapter, :api_endpoint, :authorize_url, :client_id, :client_secret, :redirect_uri, :stubs, :token_url, :user_agent

      class << self
        def keys
          @keys ||= [
            :access_token,
            :adapter,
            :api_endpoint,
            :authorize_url,
            :client_id,
            :client_secret,
            :redirect_uri,
            :stubs,
            :token_url,
            :user_agent
          ]
        end
      end

      def configure
        yield self
      end

      def reset!
        Keap::REST::Configurable.keys.each do |key|
          instance_variable_set(:"@#{key}", Keap::REST::Default.options[key])
        end

        self
      end
      alias_method :setup, :reset!

      def same_options?(opts)
        opts.hash == options.hash
      end

      private

      def options
        Keap::REST::Configurable.keys.map { |key| [key, instance_variable_get(:"@#{key}")] }.to_h
      end
    end
  end
end
