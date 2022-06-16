Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "apartmani", to: "pages#apartments", as: "apartments"
  get "lokacija", to: "pages#location", as: "location"
  get "kontakti", to: "pages#contacts", as: "contacts"
  resources :reservations, only: [:index, :new, :create], path: "rezervacije"
  get "potvrdi/:id", to: "reservations#approve", as: "approve_reservation" 
  namespace :admin do
    root "base#index"
    delete "reservations/:id", to: "reservations#destroy", as: "reservation"
    get "potvrdi/:id", to: "reservations#approve", as: "approve_reservation" 
  end
end
