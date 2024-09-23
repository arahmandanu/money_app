# frozen_string_literal: true

require 'rails_helper'
RSpec.describe V1::Users::Resources, type: :request do
  describe 'get :order_no' do
    context 'valid params' do
      let!(:endpoint) { '/api/v1/users' }

      it 'should return 200' do
        get endpoint
        expect(response).to have_http_status(200)
      end
    end
  end
end
