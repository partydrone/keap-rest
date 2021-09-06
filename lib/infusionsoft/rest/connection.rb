module Infusionsoft
  module REST
    module Connection
      def connection
        @connection ||= Faraday.new(api_endpoint) do |http|
          http.headers[:accept] = "application/json, */*"
          http.headers[:user_agent] = "Infusionsoft REST Ruby SDK v#{Infusionsoft::REST::VERSION}"

          http.request :oauth2, access_token, token_type: :bearer
          http.request :json

          http.response :dates
          http.response :json, content_type: "application/json"
          # http.response :logger do |logger|
          #   logger.filter(/(Bearer) (\w+)/, '\1 [FILTERED]')
          # end

          http.adapter adapter, @stubs
        end
      end
    end
  end
end
