Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  
  get "log_in" => "sessions#new"
  get "log_out" => "sessions#destroy"
  get "sign_up" => "users#new"
  root "chats#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, only:[:new, :create] do
   resources :chats, only: [:index, :show, :create]
   member do
      get :confirm_email
      get :new_password
      post :change_password
   end
  end 
	resources :sessions, only:[:new, :destroy, :create]
  resources :messages, only:[:create]
end
