Rails.application.routes.draw do


  get 'post/index'
  get "about-login" => "home#about_login"
  get "about-registration" => "home#about_registration"
  get "information" => "home#information"
  get "nav" => "home#nav"
  get "posts/index" => "posts#index"
  get "posts/record" => "posts#record"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#new"
  get "users/:id/edit" => "users#edit"
  get "login" => "users#login_form"
  get "groups/index" => "groups#index"
  get "change-group" => "groups#change_group"
  get "join-group" => "groups#join_group"
  get "groupup" => "groups#new"
  get "groups/:id" => "groups#show"
  get "groups/:id/edit" => "groups#edit"
  get "group-login" => "groups#login_form"

  get "/" => "home#top"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "groups/create" => "groups#create"
  post "groups/:id/update" => "groups#update"
  post "group-login" => "groups#login"
  post "group-logout" => "groups#logout"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end