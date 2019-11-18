Rails.application.routes.draw do
  resources :favorites
  resources :searches
  resources :users do 
    resources :favorites
  end 
end
