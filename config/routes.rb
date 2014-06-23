Rails.application.routes.draw do
  #  match '/auth/:provider/callback', :to => 'sessions#callback'
  resources :debates
  root to: "debates#index"
end
