# require "faraday"
# require "keap/rest/error"

module Keap
  module REST
    module Response
      class RaiseError < Faraday::Middleware
        def on_complete(response)
          if (error = Keap::REST::Error.from_response(response))
            raise error
          end
        end
      end
    end
  end
end
