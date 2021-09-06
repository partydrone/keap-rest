module Infusionsoft
  module REST
    class Error < StandardError
      class << self
        def from_response(response)
          status = response.status

          if klass = case status
            when 400 then Infusionsoft::REST::BadRequest
            when 401 then Infusionsoft::REST::Unauthorized
            when 403 then Infusionsoft::REST::Forbidden
            when 404 then Infusionsoft::REST::NotFound
            when 422 then Infusionsoft::REST::UnprocessableEntity
            when 400..499 then Infusionsoft::REST::ClientError
            when 500 then Infusionsoft::REST::InternetServerError
            when 503 then Infusionsoft::REST::ServiceUnavailable
            when 500..599 then Infusionsoft::REST::ServerError
            end

            klass.new(response)
          end
        end
      end

      def initialize(response = nil)
        @response = response
        super(build_error_message)
      end

      private

      def build_error_message
        return nil if @response.nil?

        message = "#{@response.method.to_s.upcase} "
        message << "#{@response.url.to_s}: "
        message << "#{@response.status} - "
        message << "#{@response.body['message']}" if @response.body["message"]
        message << "#{@response.body['fault']['faultstring']}" if @response.body["fault"]
        message << "\n\n#{@response.body}\n\n"

        message
      end
    end

    class ClientError < Error; end

    class BadRequest < ClientError; end

    class Unauthorized < ClientError; end

    class Forbidden < ClientError; end

    class NotFound < ClientError; end

    class UnprocessableEntity < ClientError; end

    class ServerError < Error; end

    class InternalServerError < ServerError; end

    class ServiceUnavailable < ServerError; end
  end
end
