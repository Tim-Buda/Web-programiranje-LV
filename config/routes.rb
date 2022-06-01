Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "apartmani", to: "pages#apartments", as: "apartments"
  get "lokacija", to: "pages#location", as: "location"
  get "kontakti", to: "pages#contacts", as: "contacts"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
