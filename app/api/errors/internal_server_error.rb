# frozen_string_literal: true

module API
  module Errors
    class InternalServerError < StandardError
      def initialize(message: nil, code: nil)
        @code = code || 500
        @info = message || 'Internal server error'
      end

      def message
        @info
      end

      attr_reader :code
    end
  end
end
