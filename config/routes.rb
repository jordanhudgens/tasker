Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end

  root "projects#index"
end
