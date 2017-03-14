Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      resources :links, only: [:index, :create]
    end
  end
end
