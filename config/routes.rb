Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :fundraisers, only: [:index, :new, :create, :show, :edit, :update] do
    resources :direct_donations, only: [:index, :new, :create, :show, :edit, :update]
  end

  resources :events, only: [:index, :new, :create, :show, :edit, :update]
end
