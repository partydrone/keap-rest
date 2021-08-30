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

      def appointments
        AppointmentsResource.new(self)
      end

      def campaigns
        CampaignsResource.new(self)
      end

      def companies
        CompaniesResource.new(self)
      end

      def contacts
        ContactsResource.new(self)
      end

      def connection
        @connection ||= Faraday.new(BASE_URL) do |http|
          http.headers[:accept]     = "application/json, */*"
          http.headers[:user_agent] = "Infusionsoft REST Ruby SDK v#{Infusionsoft::REST::VERSION}"

          http.request :oauth2, access_token, token_type: :bearer
          http.request :json

          http.response :dates
          http.response :json, content_type: "application/json"
          http.response :logger, nil, { headers: true, bodies: true, log_level: :debug } do |logger|
            logger.filter(/(Bearer) (\w+)/, '\1 [FILTERED]')
          end

          http.adapter adapter, @stubs
        end
      end
    end
  end
end
