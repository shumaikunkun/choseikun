Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'example/vote'
  post 'example/confirm'
  get 'example/show'
  get '*num/memo', to: 'example#memo'
  root 'example#vote'
end
