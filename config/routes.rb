Rails.application.routes.draw do
  get '/home', to: 'posts#home'
  resources :posts do
    collection do
      post :confirm
    end
  end
end
