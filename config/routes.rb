Rails.application.routes.draw do
  root 'markov_bot#index'
  resources :sentence_processor, only: [:create]
  resources :sentence_generators, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
