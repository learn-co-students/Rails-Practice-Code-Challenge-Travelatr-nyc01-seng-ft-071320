Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers
  resources :posts
  resources :destinations
  puts "/post/:id/like", to:'post#like', as: 'post_like'

end
