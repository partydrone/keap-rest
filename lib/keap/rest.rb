# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module Keap
  # Ruby toolkit for the Keap REST API.
  #
  module REST
    autoload :Client, "keap/rest/client"
    autoload :Collection, "keap/rest/collection"
    autoload :Configurable, "keap/rest/configurable"
    autoload :Connection, "keap/rest/connection"
    autoload :Default, "keap/rest/default"
    autoload :Error, "keap/rest/error"
    autoload :MerchantsCollection, "keap/rest/merchants_collection"
    autoload :Object, "keap/rest/object"
    autoload :Response, "keap/rest/response"
    autoload :Token, "keap/rest/token"
    autoload :TokenStore, "keap/rest/token_store"

    # Classes used to return a nicer object wrapping the response data
    autoload :AccountProfile, "keap/rest/objects/account_profile"
    autoload :Affiliate, "keap/rest/objects/affiliate"
    autoload :AffiliateClawback, "keap/rest/objects/affiliate_clawback"
    autoload :AffiliateCommission, "keap/rest/objects/affiliate_commission"
    autoload :AffiliatePayment, "keap/rest/objects/affiliate_payment"
    autoload :AffiliateProgram, "keap/rest/objects/affiliate_program"
    autoload :AffiliateRedirect, "keap/rest/objects/affiliate_redirect"
    autoload :AffiliateSummary, "keap/rest/objects/affiliate_summary"
    autoload :Appointment, "keap/rest/objects/appointment"
    autoload :Campaign, "keap/rest/objects/campaign"
    autoload :Company, "keap/rest/objects/company"
    autoload :Contact, "keap/rest/objects/contact"
    autoload :Email, "keap/rest/objects/email"
    autoload :EmailAddress, "keap/rest/objects/email_address"
    autoload :File, "keap/rest/objects/file"
    autoload :HookSubscription, "keap/rest/objects/hook_subscription"
    autoload :MerchantAccount, "keap/rest/objects/merchant_account"
    autoload :Note, "keap/rest/objects/note"
    autoload :Opportunity, "keap/rest/objects/opportunity"
    autoload :Order, "keap/rest/objects/order"
    autoload :OrderItem, "keap/rest/objects/order_item"
    autoload :OrderPayPlan, "keap/rest/objects/order_pay_plan"
    autoload :OrderPayment, "keap/rest/objects/order_payment"
    autoload :OrderTransaction, "keap/rest/objects/order_transaction"
    autoload :Product, "keap/rest/objects/product"
    autoload :ProductImage, "keap/rest/objects/product_image"
    autoload :ProductSubscription, "keap/rest/objects/product_subscription"
    autoload :Stage, "keap/rest/objects/stage"
    autoload :Subscription, "keap/rest/objects/subscription"
    autoload :Tag, "keap/rest/objects/tag"
    autoload :TagCategory, "keap/rest/objects/tag_category"
    autoload :Task, "keap/rest/objects/task"
    autoload :User, "keap/rest/objects/user"
    autoload :UserInfo, "keap/rest/objects/user_info"

    class << self
      include Keap::REST::Configurable

      def client
        return @client if defined?(@client) && @client.same_options?(options)
        @client = Keap::REST::Client.new(options)
      end
    end
  end
end

Keap::REST.setup
