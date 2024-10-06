# frozen_string_literal: true

module Open
  module Helpers
    module ErrorHandlerHelpers
      # Build message before send on error
      def error_response(errors)
        if errors.is_a? CleanArchitecture::UseCases::Errors
          raise Open::Errors::Exception.new(message: [errors.message], code: 400,
                                            errors: errors.as_json['active_model_errors'])
        elsif  [Symbol, String].include? errors.class
          raise Open::Errors::Exception.new(message: errors, code: 400,
                                            errors: true)
        else
          raise Open::Errors::Exception.new(message: [errors.message], code: errors.status_code,
                                            errors: errors.errors, error_code: errors.error_code)
        end
      end
    end
  end
end
