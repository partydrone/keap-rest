module Keap
  module REST
    # Client for the Keap REST API.
    #
    class Client
      autoload :AccountInfo, "keap/rest/client/account_info"
      autoload :Affiliates, "keap/rest/client/affiliates"
      autoload :Appointments, "keap/rest/client/appointments"
      autoload :Campaigns, "keap/rest/client/campaigns"
      autoload :Companies, "keap/rest/client/companies"
      autoload :Contacts, "keap/rest/client/contacts"
      autoload :EmailAddresses, "keap/rest/client/email_addresses"
      autoload :Emails, "keap/rest/client/emails"
      autoload :Files, "keap/rest/client/files"
      autoload :Hooks, "keap/rest/client/hooks"
      autoload :Locale, "keap/rest/client/locale"
      autoload :Merchants, "keap/rest/client/merchants"
      autoload :Notes, "keap/rest/client/notes"
      autoload :Opportunities, "keap/rest/client/opportunities"
      autoload :Orders, "keap/rest/client/orders"
      autoload :Products, "keap/rest/client/products"
      autoload :Settings, "keap/rest/client/settings"
      autoload :Subscriptions, "keap/rest/client/subscriptions"
      autoload :Tags, "keap/rest/client/tags"
      autoload :Tasks, "keap/rest/client/tasks"
      autoload :Transactions, "keap/rest/client/transactions"
      autoload :UserInfo, "keap/rest/client/user_info"
      autoload :Users, "keap/rest/client/users"

      include Keap::REST::Configurable
      include Keap::REST::Connection
      include Keap::REST::Client::AccountInfo
      include Keap::REST::Client::Affiliates
      include Keap::REST::Client::Appointments
      include Keap::REST::Client::Campaigns
      include Keap::REST::Client::Companies
      include Keap::REST::Client::Contacts
      include Keap::REST::Client::EmailAddresses
      include Keap::REST::Client::Emails
      include Keap::REST::Client::Files
      include Keap::REST::Client::Hooks
      include Keap::REST::Client::Locale
      include Keap::REST::Client::Merchants
      include Keap::REST::Client::Notes
      include Keap::REST::Client::Opportunities
      include Keap::REST::Client::Orders
      include Keap::REST::Client::Products
      include Keap::REST::Client::Settings
      include Keap::REST::Client::Subscriptions
      include Keap::REST::Client::Tags
      include Keap::REST::Client::Tasks
      include Keap::REST::Client::Transactions
      include Keap::REST::Client::UserInfo
      include Keap::REST::Client::Users

      def initialize(options = {})
        Keap::REST::Configurable.keys.each do |key|
          value = options.key?(key) ? options[key] : Keap::REST.instance_variable_get(:"@#{key}")
          instance_variable_set(:"@#{key}", value)
        end
      end

      # Text representation of the client, masking tokens.
      #
      # @return [String]
      #
      def inspect
        inspected = super

        inspected.gsub!(@access_token, "#{"*" * 24}#{@access_token[24..-1]}") if @access_token # standard:disable Style/SlicingWithRange
        inspected.gsub!(@client_secret, "#{"*" * 12}#{@client_secret[12..-1]}") if @client_secret # standard:disable Style/SlicingWithRange

        inspected
      end
    end
  end
end
