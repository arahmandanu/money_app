# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  scope :open do
    mount GrapeSwaggerRails::Engine => '_doc', at: '_doc', as: :open
  end
  scope :authentication do
    mount GrapeSwaggerRails::Engine => '_doc', at: '_doc', as: :authentication
  end

  # Grape Api
  mount APIBase => '/api/open'
  mount APIAuthenticationBase => '/api/authentication'
end
