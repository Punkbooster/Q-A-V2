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
  get 'how', to: 'static_pages#how'

  # frontend app
  get 'frontend_events', to: 'frontend_events#index'
  get 'frontend_event', to: 'frontend_events#show'

  resources :questions, only: [:create, :edit, :update, :destroy] do
    member do
      put 'upvote', to: 'questions#upvote'
      put 'downvote', to: 'questions#downvote'
    end
  end

  authenticate :user do
    resources :events do
    	member do
        get :settings
    		patch :start_now
    		patch :end_now
  		end
		end
  end

  post 'api_questions', to: 'api/questions#create'
  patch 'vote_question', to: 'api/questions#vote'
end
