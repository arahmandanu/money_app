# frozen_string_literal: true

module Open
  module Helpers
    module CurrentUserHelpers
      def set_current_user(user)
        @current_user = ::HashWithIndifferentAccess.new(user)
      end

      def current_user
        @current_user
      end
    end
  end
end
