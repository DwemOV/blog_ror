Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :items do
    resources :coments do
      get 'likes', as: 'likes'
      get 'unlikes', as: 'unlikes'
    end
  end
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'sessions#create'
  root 'items#index'
  get 'about'=>'items#about'
end