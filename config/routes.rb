Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :fundraisers, only: [:index, :new, :create, :show, :edit, :update] do
  #   resources :direct_donations, only: [:index, :new, :create, :show, :edit, :update]
  #   resources :events, only: [:index, :new, :create, :show, :edit, :update] do
  #     resources :event_donations, only: [:new, :create, :show]
  #   end
  # end

  resources :fundraisers, only: [:index, :new, :create, :show, :edit, :update] do
    resources :direct_donations, only: [:index, :new, :create, :show, :edit, :update]
    resources :events do
      delete "/fundraisers/:fundraiser_id/events/:id", to: "events#destroy", as: "event_destroy"
      resources :event_donations, only: [:new, :create, :show]
    end
  end

  resources :charities
  delete "/charities/:id", to: "charities#destroy", as: "charity_destroy"


end
