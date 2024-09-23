# frozen_string_literal: true

module API
  module Errors
    class ThenRaiseError < StandardError
      def initialize(message:, code:)
        @code = code
        @info = message
      end

      def message
        @info
      end

      attr_reader :code
    end
  end
end
