Rails.application.routes.draw do

  devise_for :users
  resources :users do
    resources :rooms
  end
  resources :rentals
  resources :rooms do
    resources :bookings
  end
 
   devise_scope :user do
    authenticated :user do
      root :to => 'rooms#index'
    end
    unauthenticated :user do
      root :to => 'rentals#index', as: :unauthenticated_root
  end
end

 

end
