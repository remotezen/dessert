Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/show'

  get 'posts/edit'

  get 'posts/update'

  get 'posts/delete'
	root 'home_pages#index'

  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
	resources :posts
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  #resources :microposts,          only: [:create, :destroy]
  #resources :relationships,       only: [:create, :destroy]
end
