module Infusionsoft
  module REST
    class Resource
      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def get_request(url, params: {}, headers: {})
        handle_response client.connection.get(url, params, headers)
      end

      def post_request(url, body:, headers: {})
        handle_response client.connection.post(url, body, headers)
      end

      def patch_request(url, body:, headers: {})
        handle_response client.connection.patch(url, body, headers)
      end

      def put_request(url, body:, headers: {})
        handle_response client.connection.put(url, body, headers)
      end

      def delete_request(url, params: {}, headers: {})
        handle_response client.connection.delete(url, params, headers)
      end

      def handle_response(response)
        case response.status
        when 400
          raise Error, "Bad Request. #{response.body["message"]}"
        when 401
          raise Error, "Unauthorized. #{response.body["message"]}"
        when 403
          raise Error, "Forbidden. #{response.body["message"]}"
        when 404
          raise Error, "Not Found. #{response.body["message"]}"
        when 500
          raise Error, "Internet Server Error. #{response.body["message"]}"
        when 503
          raise Error, "Service Unavailable. #{response.body["message"]}"
        end

        response
      end
    end
  end
end
