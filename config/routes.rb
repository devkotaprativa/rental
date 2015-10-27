Rails.application.routes.draw do

  get 'rooms/index'

  get 'rooms/new'

  get 'rooms/edit'

  get 'rooms/destroy'

  get 'rooms/show'

  get 'rooms/create'

  get 'rooms/update'

  devise_for :users
  resources :rentals
 

   devise_scope :user do
  authenticated :user do
    root :to => 'rentals#index'
  end
  unauthenticated :user do
    root :to => 'rentals#index', as: :unauthenticated_root
  end
end

 

end
