Rails.application.routes.draw do


  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/index'

  get 'bookings/destroy'

  get 'bookings/show'

  devise_for :users
  resources :users do
    resources :rooms
  end
  resources :rentals
 

   devise_scope :user do
    authenticated :user do
      root :to => 'rooms#index'
    end
    unauthenticated :user do
      root :to => 'rentals#index', as: :unauthenticated_root
  end
end

 

end
