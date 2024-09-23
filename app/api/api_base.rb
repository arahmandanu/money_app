# frozen_string_literal: true

require 'grape-swagger'
# Init API
class APIBase < Grape::API
  format :json
  mount Open::API
end
