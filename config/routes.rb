Rails.application.routes.draw do
  get 'markov_bot/index'
  resources :sentence_processor, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
