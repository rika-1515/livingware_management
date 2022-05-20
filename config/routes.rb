Rails.application.routes.draw do
  
  namespace :admin do
    root "homes#top"
    resources :master_categories,only:[:index,:create,:edit,:update]
    resources :master_livingwares,only:[:index,:new,:create,:edit,:update,:destroy]
    resources :inquiries,only:[:show,:update]
    resources :customers,only:[:index,:show,:edit,:update]
  end
  
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations' # signup view -> app/controllers/public/registrations_controller.rb
  }
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
