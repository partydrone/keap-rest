require "faraday"
require "faraday_middleware"

module Infusionsoft
  module REST
    class Client
      BASE_URL = "https://api.infusionsoft.com/crm/rest/v1/"

      attr_reader :access_token, :adapter

      def initialize(access_token:, adapter: Faraday.default_adapter)
        @access_token = access_token
        @adapter      = adapter
      end

      def inspect
        inspected = super
        inspected.gsub! @access_token, "#{ '*' * 24 }#{ @access_token[24..-1] }" if @access_token
        inspected
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.url_prefix = BASE_URL
          conn.request :json
          conn.response :json, content_type: "application/json"
          conn.adapter adapter
        end
      end
    end
  end
end
