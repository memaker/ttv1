Ttv1::Application.routes.draw do
  resources :corpus_neutrals


  resources :corpus_anews


  resources :corpus_negatives


  resources :corpus_positives


  resources :tweets


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end