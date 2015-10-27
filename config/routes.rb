Rails.application.routes.draw do
  get 'rentals/index'

  get 'rental/index'

  devise_for :users
  #root 'welcome#index'

end
