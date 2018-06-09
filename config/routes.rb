Rails.application.routes.draw do
  devise_for :users

  root to: 'landing_page#index'

  # Static pages
  get 'pricing', to: 'static_pages#pricing'
  get 'features', to: 'static_pages#features'
  get 'contact_us', to: 'static_pages#contact_us'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'customer_agreement', to: 'static_pages#customer_agreement'
  get 'security', to: 'static_pages#security'
  get 'jobs', to: 'static_pages#jobs'
  get 'dashboard', to: 'static_pages#dashboard'

  get 'hello_world', to: 'hello_world#index'
end
