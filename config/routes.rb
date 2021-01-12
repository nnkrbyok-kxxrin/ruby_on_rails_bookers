Rails.application.routes.draw do
  get 'todobooks/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root :to => 'books#top'
post 'todobooks' => 'todobooks#create'
get 'todobooks' => 'todobooks#inde'
get 'todobooks/:id' => 'todobooks#show', as: 'todoboo'
resources :books
end
