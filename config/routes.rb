Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
	get 'signup' =>'users#new'
	resources :users
	get 'login' => 'sessions#new'
	post 'login' =>'sessions#create'
	delete 'logout' =>'sessions#destroy'
	root 'users#index' 
get 'about'=>'users#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
