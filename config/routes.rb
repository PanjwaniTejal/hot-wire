Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stories#index'
  resources :stories do
    patch 'make_as_read', to: 'stories#make_as_read'
    patch 'make_as_unread', to: 'stories#make_as_unread'
  end
  get 'search', to: 'stories#search', as: :collection
end
