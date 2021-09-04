module Infusionsoft
  module REST
    class FilesResource < Resource
      def list(**params)
        response = get_request("files", params: params)
        Collection.from_response(response, key: "files", type: File)
      end

      def create(**attributes)
        File.new post_request("files", body: attributes).body
      end
      alias_method :upload, :create

      def delete(file_id)
        delete_request("files/#{file_id}")
      end

      def get(file_id, **params)
        File.new get_request("files/#{file_id}", params: params).body
      end
      alias_method :retrieve, :get

      def replace(file_id, **attributes)
        File.new put_request("files/#{file_id}", body: attributes).body
      end
    end
  end
end
