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
          http.headers[:user_agent] = user_agent

          http.request :authorization, :Bearer, access_token
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

      def last_response
        @last_response if defined? @last_response
      end

      private

      def request(method, path, data, headers = {})
        @last_response = response = connection.send(method, path, data, headers)
        response
      rescue Keap::REST::Error => error
        @last_response = nil
        raise error
      end
    end
  end
end
