module Infusionsoft
  module REST
    class CompaniesResource < Resource
      def list(**params)
        response = get_request("companies", params: params)
        Collection.from_response(response, key: "companies", type: Company)
      end

      def get(company_id, **params)
        Company.new get_request("companies/#{company_id}", params: params).body
      end

      def create(**attributes)
        Company.new post_request("companies", body: attributes).body
      end

      def update(company_id, **attributes)
        Company.new patch_request("companies/#{company_id}", body: attributes).body
      end

      def model
        OpenStruct.new get_request("companies/model").body
      end
    end
  end
end
