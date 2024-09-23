# frozen_string_literal: true

module Authentication
  module Helpers
    module SuccessResponseHelpers
      # Build message before send on success
      def success_response(response, code = 200)
        results = { 'status' => 'success', 'code' => code,
                    'data' => response }
        send_response(results, code)
      end

      def send_response(body, code)
        Rack::Response.new(
          body,
          code,
          { 'content-type' => 'application/json; charset=UTF-8' }
        ).body
      end
    end
  end
end
