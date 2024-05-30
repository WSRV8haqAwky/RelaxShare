Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]# 追加
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
