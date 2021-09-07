module Keap
  module REST
    class Collection
      attr_reader :data, :count, :next_page, :previous_page

      class << self
        def from_response(response, key:, type:)
          body = response.body

          new(
            data: body[key].map { |attrs| type.new(attrs) },
            count: body.dig("count"),
            next_page: body.dig("next"),
            previous_page: body.dig("previous")
          )
        end
      end

      def initialize(data:, count:, next_page: nil, previous_page: nil, sync_token: nil)
        @data = data
        @count = count
        @next_page = next_page
        @previous_page = previous_page
        @sync_token = sync_token
      end
    end
  end
end
