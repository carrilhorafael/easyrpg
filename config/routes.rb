Rails.application.routes.draw do

  resources :races
  resources :game_classes
  resources :adventures do
    resources :sessions, controller: 'adventure_sessions' do
      post :finish, on: :member
    end
  end
  resources :players, except: [:create]
  post '/sign_up', to: 'auth#sign_up'
  post '/login', to: 'auth#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
