Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  namespace :api do
    namespace :v1 do
      resources :current_user, only: [:index]
      resources :reservations, only: [:index, :destroy]
      resources :houses, only: [:index, :show, :new, :create, :destroy] do
        resources :reservations , only: [:create]
      end
    end
  end
end
