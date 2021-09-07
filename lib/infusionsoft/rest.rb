# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module Infusionsoft
  module REST
    autoload :Client, "infusionsoft/rest/client"
    autoload :Collection, "infusionsoft/rest/collection"
    autoload :Configurable, "infusionsoft/rest/configurable"
    autoload :Connection, "infusionsoft/rest/connection"
    autoload :Default, "infusionsoft/rest/default"
    autoload :Error, "infusionsoft/rest/error"
    autoload :MerchantsCollection, "infusionsoft/rest/merchants_collection"
    autoload :Object, "infusionsoft/rest/object"
    autoload :Response, "infusionsoft/rest/response"

    # Classes used to return a nicer object wrapping the response data
    autoload :AccountProfile, "infusionsoft/rest/objects/account_profile"
    autoload :Affiliate, "infusionsoft/rest/objects/affiliate"
    autoload :AffiliateClawback, "infusionsoft/rest/objects/affiliate_clawback"
    autoload :AffiliateCommission, "infusionsoft/rest/objects/affiliate_commission"
    autoload :AffiliatePayment, "infusionsoft/rest/objects/affiliate_payment"
    autoload :AffiliateProgram, "infusionsoft/rest/objects/affiliate_program"
    autoload :AffiliateRedirect, "infusionsoft/rest/objects/affiliate_redirect"
    autoload :AffiliateSummary, "infusionsoft/rest/objects/affiliate_summary"
    autoload :Appointment, "infusionsoft/rest/objects/appointment"
    autoload :Campaign, "infusionsoft/rest/objects/campaign"
    autoload :Company, "infusionsoft/rest/objects/company"
    autoload :Contact, "infusionsoft/rest/objects/contact"
    autoload :Email, "infusionsoft/rest/objects/email"
    autoload :EmailAddress, "infusionsoft/rest/objects/email_address"
    autoload :File, "infusionsoft/rest/objects/file"
    autoload :HookSubscription, "infusionsoft/rest/objects/hook_subscription"
    autoload :MerchantAccount, "infusionsoft/rest/objects/merchant_account"
    autoload :Note, "infusionsoft/rest/objects/note"
    autoload :Opportunity, "infusionsoft/rest/objects/opportunity"
    autoload :Order, "infusionsoft/rest/objects/order"
    autoload :OrderItem, "infusionsoft/rest/objects/order_item"
    autoload :OrderPayPlan, "infusionsoft/rest/objects/order_pay_plan"
    autoload :OrderPayment, "infusionsoft/rest/objects/order_payment"
    autoload :OrderTransaction, "infusionsoft/rest/objects/order_transaction"
    autoload :Product, "infusionsoft/rest/objects/product"
    autoload :ProductImage, "infusionsoft/rest/objects/product_image"
    autoload :ProductSubscription, "infusionsoft/rest/objects/product_subscription"
    autoload :Stage, "infusionsoft/rest/objects/stage"
    autoload :Subscription, "infusionsoft/rest/objects/subscription"
    autoload :Tag, "infusionsoft/rest/objects/tag"
    autoload :TagCategory, "infusionsoft/rest/objects/tag_category"
    autoload :Task, "infusionsoft/rest/objects/task"
    autoload :User, "infusionsoft/rest/objects/user"
    autoload :UserInfo, "infusionsoft/rest/objects/user_info"

    class << self
      include Infusionsoft::REST::Configurable

      def client
        return @client if defined?(@client) && @client.same_options?(options)
        @client = Infusionsoft::REST::Client.new(options)
      end
    end
  end
end

Infusionsoft::REST.setup
