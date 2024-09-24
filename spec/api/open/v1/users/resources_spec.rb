# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Open::V1::Users::Resources, type: :request do
  describe 'Open::V1::Users::Resources' do
    context 'valid params' do
      let(:actor) { create :user }
      let(:tokenizer) { create :tokenizer, resource_owner_id: actor.auth.id }
      before do
        actor
      end
      it 'should return 200' do
        get '/api/open/v1/users', headers: { authorization: "bearer #{tokenizer.token}" }
        expect(response).to have_http_status(200)
      end
    end
  end
end
