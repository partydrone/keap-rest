# require "faraday"
# require "infusionsoft/rest/error"

module Infusionsoft
  module REST
    module Response
      class RaiseError < Faraday::Middleware
        def on_complete(response)
          if (error = Infusionsoft::REST::Error.from_response(response))
            raise error
          end
        end
      end
    end
  end
end
