Rails.application.routes.draw do
  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end

  root "projects#index"
end
