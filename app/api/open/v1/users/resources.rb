# frozen_string_literal: true

module Open
  module V1
    module Users
      # Resources api for users
      class Resources < Grape::API
        # use V1::AplicationResources

        desc 'list users all' do
          detail 'Detail path'
          tags ['paths']
        end
        get '' do
          byebug
        end
      end
    end
  end
end
