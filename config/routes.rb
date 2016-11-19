Rails.application.routes.draw do
  resources :ideas do
    collection do
      get 'random'
      get 'top'
    end

    member do
      post 'click'
    end
  end
  
  resources :concerns do
    collection do
      get 'reset'
    end
  end

  get '/about', to: 'static#about', as: :about
  
  get '/', to: 'ideas#random'
end
