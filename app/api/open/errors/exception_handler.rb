# frozen_string_literal: true

module Open
  module Errors
    class Exception < StandardError
      attr_accessor :message, :code, :errors, :error_code

      def initialize(message: nil, code: 500, errors: {}, error_code: '')
        super
        self.message = message
        self.code = code
        self.errors = errors
        self.error_code = error_code
      end
    end

    module ExceptionHandler
      def self.included(base)
        base.instance_eval do
          rescue_from :all do |e|
            # When required params are missing or validation fails
            if e.class.name == 'RaiseErrorInApi'
              code = e.code
            elsif e.class.name == 'Grape::Exceptions::ValidationErrors'
              code = 400
              e.errors.transform_keys! { |k| k[0] }
            elsif e.class.name == 'Grape::Exceptions::InvalidMessageBody'
              code = 400
            elsif e.class.name == 'ActiveRecord::RecordNotFound'
              code = 404
            elsif e.is_a?(ActiveRecord::RecordInvalid) || e.is_a?(ActiveRecord::RecordNotDestroyed)
              code = 422
            elsif e.class.name == 'Grape::Exceptions::MethodNotAllowed'
              code = 405
            elsif e.class.name == 'CommerceService::Exceptions::ErrorException' || e.class.name == 'FrontendService::Exceptions::ErrorException'
              code = e.code
            else
              code = 500
            end
            messages = begin
              e.message
            rescue StandardError
              'Oops, something went wrong!'
            end
            messages = [messages] if messages.class != Array
            Rack::Response.new(
              {
                status: 'error',
                error: {
                  code:,
                  messages:,
                  errors: begin
                    e.errors
                  rescue StandardError
                    {}
                  end,
                  error_code: begin
                    e.error_code
                  rescue StandardError
                    ''
                  end
                }
              }.to_json,
              code,
              {
                'content-type' => 'application/json; charset=UTF-8'
              }
            )
          end
        end
      end
    end
  end
end
