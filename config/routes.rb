Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :url_links, only: [:create, :index]

  get '/:hash' => redirect { |params| "/?hash=#{params[:hash]}" }
end
