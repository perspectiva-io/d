Rails.application.routes.draw do
  #  match '/auth/:provider/callback', :to => 'sessions#callback'
  resources :debates
  get 'typography', to: 'typography#show'
  get 'typography/paragraphs', to: 'typography#paragraphs'
  get 'typography/titles', to: 'typography#titles'
  root to: 'debates#index'
end
