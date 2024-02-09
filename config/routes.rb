Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end

  get "search" => "searches#search"

  resources :users, only: [:index,:show,:edit,:update,] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

 resources :chats, only: [:show, :create, :destroy]

 get 'tagsearches/search', to: 'tagsearches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #cd bookers2-debug-b
  #bundle exec rspec spec/ --format documentation
  #rails routes
end
                                  #search GET    /search(.:format)                                                                                 searches#search
                         #user_followings GET    /users/:user_id/followings(.:format)                                                              relationships#followings
                          #user_followers GET    /users/:user_id/followers(.:format)                                                               relationships#followers
                        #new_user_session GET    /users/sign_in(.:format)                                                                          devise/sessions#new
                            #user_session POST   /users/sign_in(.:format)                                                                          devise/sessions#create
                    #destroy_user_session DELETE /users/sign_out(.:format)                                                                         devise/sessions#destroy
                       #new_user_password GET    /users/password/new(.:format)                                                                     devise/passwords#new
                      #edit_user_password GET    /users/password/edit(.:format)                                                                    devise/passwords#edit
                           #user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
                                         #PUT    /users/password(.:format)                                                                         devise/passwords#update
                                         #POST   /users/password(.:format)                                                                         devise/passwords#create
                #cancel_user_registration GET    /users/cancel(.:format)                                                                           devise/registrations#cancel
                   #new_user_registration GET    /users/sign_up(.:format)                                                                          devise/registrations#new
                  #edit_user_registration GET    /users/edit(.:format)                                                                             devise/registrations#edit
                       #user_registration PATCH  /users(.:format)                                                                                  devise/registrations#update
                                         #PUT    /users(.:format)                                                                                  devise/registrations#update
                                         #DELETE /users(.:format)                                                                                  devise/registrations#destroy
                                         #POST   /users(.:format)                                                                                  devise/registrations#create
                                    #root GET    /                                                                                                 homes#top
                              #home_about GET    /home/about(.:format)                                                                             homes#about
                                   #books GET    /books(.:format)                                                                                  books#index
                                         #POST   /books(.:format)                                                                                  books#create
                               #edit_book GET    /books/:id/edit(.:format)                                                                         books#edit
                                    #book GET    /books/:id(.:format)                                                                              books#show
                                         #PATCH  /books/:id(.:format)                                                                              books#update
                                         #PUT    /books/:id(.:format)                                                                              books#update
                                         #DELETE /books/:id(.:format)                                                                              books#destroy
                                   #users GET    /users(.:format)                                                                                  users#index
                               #edit_user GET    /users/:id/edit(.:format)                                                                         users#edit
                                    #user GET    /users/:id(.:format)                                                                              users#show
                                         #PATCH  /users/:id(.:format)                                                                              users#update
                                         #PUT    /users/:id(.:format)                                                                              users#update
                           #book_favorite DELETE /books/:book_id/favorite(.:format)                                                                favorites#destroy
                                         #POST   /books/:book_id/favorite(.:format)                                                                favorites#create
                      #book_book_comments POST   /books/:book_id/book_comments(.:format)                                                           book_comments#create