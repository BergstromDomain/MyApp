Rails.application.routes.draw do
  root to: 'pages#home'

  get 'about-me',       to: 'pages#about'
  get 'contact',     to: 'pages#contact'
  get 'event-tracker',  to: 'pages#event_tracker'
  
  resources :blogs

  resources :people do
    resources :events
  end
  resources :events, :only => [:index]

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
