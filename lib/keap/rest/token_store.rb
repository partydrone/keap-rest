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
          token = load_token
          return token.access_token unless token.expired?
          new_token = Keap::REST::Token.refresh(refresh_token: token.refresh_token)
          save_token(new_token)
          new_token.access_token
        end

        # Retrieve a {Token} object from the store.
        #
        # @return [Token]
        #
        def load_token
          @stored_token
        end

        # Save a {Token} object to the store.
        #
        # @param token [Token] A token object.
        #
        # @return [Boolean]
        #
        def save_token(token)
          @stored_token = token
          !!@stored_token
        end
      end
    end
  end
end
