Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :statistics, except: [ :show]
  get "state/:state", to: "statistics#show"
  get "county/:state/:county_name", to: "statistics#show_county"
  root "statistics#index"
end
