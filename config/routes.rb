Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :courses, only: %i[index]
      resources :offers, only: %i[index]
    end
  end
end
