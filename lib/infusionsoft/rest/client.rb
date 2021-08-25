module Infusionsoft
  module REST
    class Client
      BASE_URL = "https://api.infusionsoft.com/crm/rest/v1"

      attr_reader :access_token, :adapter

      def initialize(access_token:, adapter: Faraday.default_adapter, stubs: nil)
        @access_token = access_token
        @adapter      = adapter
        @stubs        = stubs
      end

      def inspect
        inspected = super
        inspected.gsub! @access_token, "#{ '*' * 24 }#{ @access_token[24..-1] }" if @access_token
        inspected
      end

      def account
        AccountResource.new(self)
      end

      def affiliates
        AffiliatesResource.new(self)
      end

      def contacts
        ContactsResource.new(self)
      end

      def connection
        @connection ||= Faraday.new(BASE_URL) do |conn|
          conn.request :oauth2, access_token, token_type: :bearer
          conn.request :json
          conn.response :json, content_type: "application/json"
          conn.adapter adapter, @stubs
        end
      end
    end
  end
end
