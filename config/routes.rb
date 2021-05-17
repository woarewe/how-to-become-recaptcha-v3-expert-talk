Rails.application.routes.draw do
  root to: "contact_inquiries#new"

  resources :contact_inquiries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
