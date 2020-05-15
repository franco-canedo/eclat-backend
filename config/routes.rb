Rails.application.routes.draw do
  resources :project_pictures
  resources :projects
  resources :pictures
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      patch '/update', to: 'users#update'
      get '/gallery', to: 'users#gallery'
      post '/updateAbout', to: 'users#updateAbout'
      post 'updateContact', to: 'users#updateContact'
    end
  end

  post '/photo', to: 'pictures#create'
  get '/allPhotos', to: 'pictures#index'
  post '/deletePhoto', to: 'pictures#delete'
  get '/projects', to: 'projects#index'
  post '/newProject', to: 'projects#create'
  post 'deleteProject', to: 'projects#delete'
  post '/projectPicture', to: 'project_pictures#create'
  get '/projects/:id', to: 'projects#show'
  post '/deleteProjectPicture', to: 'project_pictures#delete'
end
