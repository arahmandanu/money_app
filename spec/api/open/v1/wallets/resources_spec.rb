# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Open::V1::Wallets::Resources, type: :request do
  let(:actor) { create :user }
  let(:tokenizer) { create :tokenizer, resource_owner_id: actor.auth.id }

  before do
    actor
  end
  describe 'Open::V1::Wallets::Resources' do
    context 'valid params get wallet info' do
      it 'should return user wallet info with http code (200)' do
        get '/api/open/v1/wallets/my_info', headers: { authorization: "bearer #{tokenizer.token}" }
        expect(response).to have_http_status(200)
      end
    end

    context 'valid params user deposit wallet' do
      it 'should return user wallet info with http code (200)' do
        post '/api/open/v1/wallets/action',
             headers: { authorization: "bearer #{tokenizer.token}" }, params: { transaction_type: 'deposit', total_money: 500_000 }
        expect(response).to have_http_status(201)
        body = ActiveSupport::HashWithIndifferentAccess.new(JSON(response.body))
        expect(body[:data]['wallet']).to eq('1500000')
      end
    end
  end
end
