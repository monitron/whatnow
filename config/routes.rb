Rails.application.routes.draw do
  resources :ideas do
    collection do
      get 'random'
    end
  end
  #resources :concerns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
