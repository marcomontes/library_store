Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create, :show, :destroy] do
        collection do
          get 'search_by_title'
          get 'search_by_isbn'
        end
      end
    end
  end
end
