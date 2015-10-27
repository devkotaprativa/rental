Rails.application.routes.draw do

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
