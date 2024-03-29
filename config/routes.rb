Mikelyons::Application.routes.draw do
  root 'pages#show', page: "about"

  get '/pages/:page', to: 'pages#show', as: :page

  match '/about', to: 'pages#about', via: 'get'
  match '/projects', to: 'pages#projects', via: 'get'
  match '/contact', to: 'pages#contact', via: 'get'

  get '/blog', to: 'blog_posts#show_all', as: :blog
  get '/blog/category/:category', to: 'blog_posts#show_category', as: :blog_category
  get 'blog/:id', to: "blog_posts#show", as: :id


  namespace :admin do
    root to: "home#index"
    resources :blog, only: [:index]
    resources :blog_posts, except: [:index]
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
    resources :pages
    resources :admin_actions
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
