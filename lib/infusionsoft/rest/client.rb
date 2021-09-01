module Infusionsoft
  module REST
    class Client
      include Infusionsoft::REST::Connection

      BASE_URL = "https://api.infusionsoft.com/crm/rest/v1"

      attr_reader :access_token, :adapter

      def initialize(access_token:, adapter: Faraday.default_adapter, stubs: nil)
        @access_token = access_token
        @adapter = adapter
        @stubs = stubs
      end

      def inspect
        inspected = super
        inspected.gsub! @access_token, "#{"*" * 24}#{@access_token[24..]}" if @access_token
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

      def locale
        LocaleResource.new(self)
      end

      def orders
        OrdersResource.new(self)
      end

    end
  end
end
