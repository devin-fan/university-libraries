UniversityLibraries::Application.routes.draw do
    # root 'films#index' -------> ROOT FOR PAGE, changed to home, can toggle

    resources :films
    resources :tags
    resources :sessions
    resources :users
    get 'search' => 'films#search'
    get 'films/:id/edit' => 'films#edit'
    get 'films/:id/download' => 'films#download'
    get 'films/:id/view' => 'films#view'
    get 'login' => 'sessions#new', as: :login
    get 'logout' => 'sessions#destroy', as: :logout
    get 'admin_form' => 'films#admin_form', as: :admin_form
# Semi-static page routes
    get 'home' => 'home#home', as: :home
    get 'about' => 'home#about', as: :about

    root :to => 'home#home'

# For PDF Viewer

mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'


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
