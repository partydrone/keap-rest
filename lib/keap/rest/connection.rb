module Keap
  module REST
    module Connection
      def get(url, params: {}, headers: {})
        request :get, url, params, headers
      end

      def post(url, body:, headers: {})
        request :post, url, body, headers
      end

      def put(url, body:, headers: {})
        request :put, url, body, headers
      end

      def patch(url, body:, headers: {})
        request :patch, url, body, headers
      end

      def delete(url, params: {}, headers: {})
        request :delete, url, params, headers
      end

      def connection
        @connection ||= Faraday.new(api_endpoint) do |http|
          http.headers[:accept] = "application/json, */*"
          http.headers[:user_agent] = "Keap REST Ruby SDK v#{Keap::REST::VERSION}"

          http.request :oauth2, access_token, token_type: :bearer
          http.request :json

          http.use Keap::REST::Response::RaiseError

          http.response :dates
          http.response :json, content_type: "application/json"
          # http.response :logger do |logger|
          #   logger.filter(/(Bearer) (\w+)/, '\1 [FILTERED]')
          # end

          http.adapter adapter, @stubs
        end
      end

      private

      def request(method, path, data, headers = {})
        connection.send(method, path, data, headers)
      rescue Keap::REST::Error => error
        raise error
      end
    end
  end
end
