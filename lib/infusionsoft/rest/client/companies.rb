module Infusionsoft
  module REST
    class Client
      # Methods for the Companies API
      #
      # @see https://developer.infusionsoft.com/docs/rest/#!/Company
      module Companies
        # Retrieves a list of all companies.
        #
        # @param limit [Integer] Limits the number of items returned.
        # @param offset [Integer] Sets a beginning range of items to return
        # @param company_name [String] Optional company name to query on
        # @param order [String] Attribute by which to order items. Can be one of
        #   `id`, `date_created`, `name`, or `email`.
        # @param order_direction [String] How to order the data: `ascending`
        #   (A–Z) or `descending` (Z–A)
        # @param optional_properties [String] A comma-delimited list of
        #   Company properties to include in the response. (Fields such as
        #   `notes`, `fax_number`, and `custom_fields` are not included
        #   by default.)
        # @return [Collection<Company>] a paginatable collection of company
        #   objects
        # @see https://developer.infusionsoft.com/docs/rest/#!/Company/listCompaniesUsingGET
        def companies(**params)
          response = get("companies", params: params)
          Collection.from_response(response, key: "companies", type: Company)
        end
        alias_method :list_companies, :companies

        def company(company_id, **params)
          Company.new get("companies/#{company_id}", params: params).body
        end
        alias_method :retrieve_company, :company

        def create_company(**attributes)
          Company.new post("companies", body: attributes).body
        end

        def update_company(company_id, **attributes)
          Company.new patch("companies/#{company_id}", body: attributes).body
        end

        def company_model
          Object.new get("companies/model").body
        end
      end
    end
  end
end
