Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "apartmani", to: "pages#apartments", as: "apartments"
  get "lokacija", to: "pages#location", as: "location"
  get "kontakti", to: "pages#contacts", as: "contacts"
  resources :reservations, only: [:index, :new, :create], path: "rezervacije"
  namespace :admin do
    root "base#index"
  end
end
