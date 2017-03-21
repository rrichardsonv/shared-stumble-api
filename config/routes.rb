Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      match "*all", :controller => "application", :action =>"cors_preflight_check", :via => :options
      get '/links/random', :controller => 'links', :action => 'show'
      resources :users, only: [:create]
      resources :links, only: [:index, :create]
    end
  end
end
