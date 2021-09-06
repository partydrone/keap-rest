module Infusionsoft
  module REST
    class Client
      include Infusionsoft::REST::Configurable
      include Infusionsoft::REST::Connection

      def initialize(options = {})
        Infusionsoft::REST::Configurable.keys.each do |key|
          value = options.key?(key) ? options[key] : Infusionsoft::REST.instance_variable_get(:"@#{key}")
          instance_variable_set(:"@#{key}", value)
        end
      end

      def inspect
        inspected = super

        inspected.gsub!(@access_token, "#{"*" * 24}#{@access_token[24..-1]}") if @access_token # standard:disable Style/SlicingWithRange
        inspected.gsub!(@client_secret, "#{"*" * 12}#{@client_secret[12..-1]}") if @client_secret # standard:disable Style/SlicingWithRange

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

      def email_addresses
        EmailAddressesResource.new(self)
      end

      def emails
        EmailsResource.new(self)
      end

      def files
        FilesResource.new(self)
      end

      def hooks
        HooksResource.new(self)
      end

      def locale
        LocaleResource.new(self)
      end

      def merchants
        MerchantsResource.new(self)
      end

      def notes
        NotesResource.new(self)
      end

      def opportunities
        OpportunitiesResource.new(self)
      end

      def orders
        OrdersResource.new(self)
      end

      def products
        ProductsResource.new(self)
      end

      def settings
        SettingsResource.new(self)
      end

      def subscriptions
        SubscriptionsResource.new(self)
      end

      def tags
        TagsResource.new(self)
      end

      def tasks
        TasksResource.new(self)
      end

      def transactions
        TransactionsResource.new(self)
      end

      def user_info
        UserInfoResource.new(self)
      end

      def users
        UsersResource.new(self)
      end
    end
  end
end
