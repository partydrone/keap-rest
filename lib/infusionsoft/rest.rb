# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require_relative "rest/version"

module Infusionsoft
  module REST
    autoload :Client, "infusionsoft/rest/client"
    autoload :Collection, "infusionsoft/rest/collection"
    autoload :Error, "infusionsoft/rest/error"
    autoload :Object, "infusionsoft/rest/object"

    # Your code goes here...
    # Classes used to return a nicer object wrapping the response data
    autoload :Account, "infusionsoft/rest/objects/account"
    autoload :Affiliate, "infusionsoft/rest/objects/affiliate"
    autoload :Appointment, "infusionsoft/rest/objects/appointment"
    autoload :Campaign, "infusionsoft/rest/objects/campaign"
    autoload :Company, "infusionsoft/rest/objects/company"
    autoload :Contact, "infusionsoft/rest/objects/contact"
    autoload :Email, "infusionsoft/rest/objects/email"
    autoload :EmailAddress, "infusionsoft/rest/objects/email_address"
    autoload :File, "infusionsoft/rest/objects/file"
    # Locale: Figure out how to handle countries and provinces
    autoload :Merchant, "infusionsoft/rest/objects/merchant"
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
    # ProductStatuses
    autoload :Subscription, "infusionsoft/rest/objects/subscription"
    autoload :Tag, "infusionsoft/rest/objects/tag"
    autoload :Task, "infusionsoft/rest/objects/task"
    autoload :User, "infusionsoft/rest/objects/user"
    autoload :UserInfo, "infusionsoft/rest/objects/user_info"
  end
end
