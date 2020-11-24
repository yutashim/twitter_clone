Rails.application.routes.draw do
  get '/home', to: 'posts#home'
  resources :posts 
end
