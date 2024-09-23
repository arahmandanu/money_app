# frozen_string_literal: true

require 'grape-swagger'
# Init API
class APIAuthenticationBase < Grape::API
  format :json
  mount Authentication::API
end
