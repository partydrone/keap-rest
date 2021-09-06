module Infusionsoft
  module REST
    class Client
      # Methods for the Account Info API
      #
      # @see https://developer.infusionsoft.com/docs/rest/#!/Account_Info
      module AccountInfo
        # Retrieves profile/company info for an account.
        #
        # @return [AccountProfile] an account profile object
        # @see https://developer.infusionsoft.com/docs/rest/#!/Account_Info/getAccountProfileUsingGET
        def account
          AccountProfile.new get("account/profile").body
        end
        alias_method :account_profile, :account

        # Updates profile/company info for an account.
        #
        # @param address [Hash]
        # @option address [String] :country_code The three-character code for
        #   a country
        # @option address [String] :field ("OTHER") The address type. Can be
        #   one of `BILLING`, `SHIPPING`, or `OTHER`
        # @option address [String] :line1
        # @option address [String] :line2
        # @option address [String] :locality
        # @option address [String] :postal_code Field used to store postal
        #   codes containing a combination of letters and numbers (e.g., EC1A,
        #   S1 2HE, or 75000)
        # @option address [String] :region
        # @option address [String] :zip_code Mainly used in the United States,
        #   this is typically numeric (e.g., 85001, 90002). NOTE: This is to be
        #   used _instead of_ `postal_code`, not in addition to.
        # @option address [String] :zip_four Last for digits of a full ZIP code
        #   (e.g., 8244, 4320). This field is supplemental to `zip_code` and
        #   will be ignored otherwise.
        # @param business_goals [Array<String>] The goals of the business
        #   (e.g., Grow business, Convert more leads)
        # @param business_primary_color [String] a color in hex notation
        #   (i.e., #0000, #def931)
        # @param business_secondary_color [String] a color in hex notation
        #   (i.e., #0000, #def931)
        # @param business_type [String] The type of business
        # @param currency_code [String]
        # @param email [String]
        # @param language_tag [String]
        # @param logo_url [String]
        # @param name [String]
        # @param phone [String]
        # @param phone_ext [String]
        # @param time_zone [String]
        # @param website [String]
        # @return [AccountProfile] an account profile object
        # @see https://developer.infusionsoft.com/docs/rest/#!/Account_Info/updateAccountInfoUsingPUT
        def update_account(**attributes)
          AccountProfile.new put("account/profile", body: attributes).body
        end
        alias_method :update_account_profile, :update_account
      end
    end
  end
end
