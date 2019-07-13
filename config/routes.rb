Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '*num/vote', to: 'example#vote'
  post '*num/confirm', to: 'example#confirm'
  get '*num/show', to: 'example#show'
  get '*num/memo', to: 'example#memo'
  root 'example#home'
  get 'example/home'
  get 'example/all'
  post 'example/inform'
end
