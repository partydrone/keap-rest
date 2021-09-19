module Keap
  module REST
    class Client
      # Methods for the Companies API
      #
      # @see https://developer.keap.com/docs/rest/#!/Company
      #
      module Companies
        # Retrieves a list of all companies.
        #
        # @param limit [Integer] Limits the number of items returned.
        # @param offset [Integer] Sets a beginning range of items to return
        # @param company_name [String] Optional company name to query on
        # @param order [String] Attribute by which to order items. Can be one of
        #   <tt>id</tt>, <tt>date_created</tt>, <tt>name</tt>, or <tt>email</tt>.
        # @param order_direction [String] How to order the data: <tt>ascending</tt>
        #   (A–Z) or <tt>descending</tt> (Z–A)
        # @param optional_properties [String] A comma-delimited list of
        #   Company properties to include in the response. (Fields such as
        #   <tt>notes</tt>, <tt>fax_number</tt>, and <tt>custom_fields</tt> are
        #   not included by default.)
        #
        # @return [Collection<Company>] a paginatable collection of company
        #   objects
        #
        # @see https://developer.keap.com/docs/rest/#!/Company/listCompaniesUsingGET
        #   Keap REST API—List Companies
        #
        def companies(**params)
          response = get("companies", params: params)
          Collection.from_response(response, key: "companies", type: Company)
        end
        alias_method :list_companies, :companies

        # Retrieve a single company
        #
        # @param company_id [Integer] Company ID.
        # @param optional_properties [String] A comma-delimited list of Company
        #   properties to include in the response. (Fields such as <tt>note</tt>,
        #   <tt>fax_number</tt>, and <tt>custom_fields</tt> are not included by default.)
        #
        # @return [Company] A company object.
        #
        # @see https://developer.infusionsoft.com/docs/rest/#!/Company/getCompanyUsingGET
        #  Keap REST API—Retrieve a Company
        #
        def company(company_id, **params)
          Company.new get("companies/#{company_id}", params: params).body
        end
        alias_method :retrieve_company, :company

        # Creates a new company as the authenticated user.
        #
        # @param **attributes [Hash] Properties and values to set for this company.
        #
        # @return [Company] A company object
        #
        # @note Company must contain at least the <tt>company_name</tt>. The
        #   <tt>country_code</tt> is required if <tt>region</tt> is specified.
        #
        # @see https://developer.keap.com/docs/rest/#!/Company/createCompanyUsingPOST
        #   Keap REST API—Create a Company
        #
        def create_company(**attributes)
          Company.new post("companies", body: attributes).body
        end

        # Updates a company with the values provided in the request.
        #
        # @param company_id [Integer] Company ID.
        # @param **attributes [Hash] Attributes to update for this company.
        #
        # @return [Company] A company object.
        #
        # @see https://developer.infusionsoft.com/docs/rest/#!/Company/updateCompanyUsingPATCH
        #   Keap REST API—Update a Company
        #
        def update_company(company_id, **attributes)
          Company.new patch("companies/#{company_id}", body: attributes).body
        end

        # Get custom fields and optional properties for the Company object.
        #
        # @return [Object] An object containing custom fields on the company
        #   model.
        #
        # @see https://developer.infusionsoft.com/docs/rest/#!/Company/retrieveCompanyModelUsingGET
        #   Keap REST API—Retrieve Company Model
        #
        def company_model
          Object.new get("companies/model").body
        end
      end
    end
  end
end
