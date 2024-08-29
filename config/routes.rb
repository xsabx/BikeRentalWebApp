Rails.application.routes.draw do
  devise_for :users

  resources :bikes, only: [:index] do
    member do
      get 'rent'   # Route to view reservation page
      post 'reserve'  # Route to reserve a bike
    end
  end

  resources :rentals, only: [:index, :destroy]  # Routes to view and cancel reservations

  root 'bikes#index'  # Root path showing bikes
end


