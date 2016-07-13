Rails.application.routes.draw do

  # General app to dos
  # Need to add confirmation indexes and db:migrate

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: [:index, :create]
  resources :chat_rooms
  get 'about' => 'static_pages#about'

  root 'chat_rooms#index'
  mount ActionCable.server => '/cable'

end
