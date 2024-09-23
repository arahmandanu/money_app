# frozen_string_literal: true

class Authentication::V1::AplicationResources < Grape::API
  AUTHORIZATION_HEADERS = { Authorization: { description: 'Access Token', required: true } }.freeze
  public_constant :AUTHORIZATION_HEADERS

  OPTIONAL_AUTHORIZATION_HEADERS = { Authorization: { description: 'Access Token', required: false } }.freeze
  public_constant :OPTIONAL_AUTHORIZATION_HEADERS
end
