Rails.application.routes.draw do
  get 's3/direct_post'
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
      post '/update', to: 'users#update'
      get '/logo', to: 'users#logo'
      get '/gallery', to: 'users#gallery'
      post '/updateAbout', to: 'users#updateAbout'
      post 'updateContact', to: 'users#updateContact'
      get '/aboutInfo', to: 'users#about'
    end
  end

  post '/photo', to: 'pictures#create'
  get '/getLogo', to: 'pictures#logo'
  get '/allPhotos', to: 'pictures#index'
  post '/deletePhoto', to: 'pictures#delete'
  get '/projects', to: 'projects#index'
  post '/newProject', to: 'projects#create'
  post '/deleteProject', to: 'projects#delete'
  post '/editProject', to: 'projects#edit'
  post '/projectPicture', to: 'project_pictures#create'
  get '/projects/:id', to: 'projects#show'
  post '/deleteProjectPicture', to: 'project_pictures#delete'
  get '/s3/direct_post', to: 's3#direct_post'

end
