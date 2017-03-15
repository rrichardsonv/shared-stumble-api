Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      resources :users, only: [:create]
      resources :links, only: [:index, :create]
    end
  end
end
