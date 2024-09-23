# frozen_string_literal: true

module Authentication
  module Helpers
    module CurrentUserHelpers
      def set_current_user(user)
        @current_user = Hashie::Mash.new(user.as_json)
      end

      def current_user
        @current_user
      end
    end
  end
end
