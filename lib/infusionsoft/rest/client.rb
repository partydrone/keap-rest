module Infusionsoft
  module REST
    class Client
      autoload :AccountInfo, "infusionsoft/rest/client/account_info"
      autoload :Affiliates, "infusionsoft/rest/client/affiliates"
      autoload :Campaigns, "infusionsoft/rest/client/campaigns"
      autoload :Companies, "infusionsoft/rest/client/companies"
      autoload :Contacts, "infusionsoft/rest/client/contacts"
      autoload :EmailAddresses, "infusionsoft/rest/client/email_addresses"
      autoload :Emails, "infusionsoft/rest/client/emails"
      autoload :Files, "infusionsoft/rest/client/files"
      autoload :Hooks, "infusionsoft/rest/client/hooks"
      autoload :Locale, "infusionsoft/rest/client/locale"
      autoload :Merchants, "infusionsoft/rest/client/merchants"
      autoload :Notes, "infusionsoft/rest/client/notes"
      autoload :Opportunities, "infusionsoft/rest/client/opportunities"
      autoload :Orders, "infusionsoft/rest/client/orders"
      autoload :Products, "infusionsoft/rest/client/products"
      autoload :Settings, "infusionsoft/rest/client/settings"
      autoload :Subscriptions, "infusionsoft/rest/client/subscriptions"
      autoload :Tags, "infusionsoft/rest/client/tags"
      autoload :Tasks, "infusionsoft/rest/client/tasks"
      autoload :Transactions, "infusionsoft/rest/client/transactions"
      autoload :UserInfo, "infusionsoft/rest/client/user_info"
      autoload :Users, "infusionsoft/rest/client/users"

      include Infusionsoft::REST::Configurable
      include Infusionsoft::REST::Connection
      include Infusionsoft::REST::Client::AccountInfo
      include Infusionsoft::REST::Client::Affiliates
      include Infusionsoft::REST::Client::Campaigns
      include Infusionsoft::REST::Client::Companies
      include Infusionsoft::REST::Client::Contacts
      include Infusionsoft::REST::Client::EmailAddresses
      include Infusionsoft::REST::Client::Emails
      include Infusionsoft::REST::Client::Files
      include Infusionsoft::REST::Client::Hooks
      include Infusionsoft::REST::Client::Locale
      include Infusionsoft::REST::Client::Merchants
      include Infusionsoft::REST::Client::Notes
      include Infusionsoft::REST::Client::Opportunities
      include Infusionsoft::REST::Client::Orders
      include Infusionsoft::REST::Client::Products
      include Infusionsoft::REST::Client::Settings
      include Infusionsoft::REST::Client::Subscriptions
      include Infusionsoft::REST::Client::Tags
      include Infusionsoft::REST::Client::Tasks
      include Infusionsoft::REST::Client::Transactions
      include Infusionsoft::REST::Client::UserInfo
      include Infusionsoft::REST::Client::Users

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
    end
  end
end
