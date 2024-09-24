# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Authentication::V1::Authentication::Resources, type: :request do
  describe 'Authentication::V1::Authentication::Resources' do
    context 'valid params' do
      let(:actor) { create :user }
      before do
        actor
      end
      it 'should return 201' do
        post '/api/authentication/v1/login',
             params: { email: actor.email, password: 'nopassword' }
        expect(response).to have_http_status(201)
      end
    end
  end
end
