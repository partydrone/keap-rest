module Keap
  module REST
    # The token store provides a central location where instances of {Client}
    # can access a valid access token to authorize each request to the API.
    #
    class TokenStore
      class << self
        # Get a token object from the store.
        #
        # @return [Token]
        #
        def get_token
          "b86qpzY9j5cXO4WAWlkABVYOs97W"
        end

        # Save a {Token} object in the store.
        #
        # @param token [Token] A token object.
        #
        # @return [Boolean]
        #
        def save_token(token)
        end
      end
    end
  end
end
