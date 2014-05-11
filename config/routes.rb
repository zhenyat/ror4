Ror4::Application.routes.draw do

  ### ZT:  Handle locale (source: http://dhampik.ru/blog/rails-routes-tricks-with-locales ###

  # add locale to URL and redirect to corresponding pages
  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :groups
    resources :pictures
    resources :products
    resources :categories
    resources :sections

    post 'upload',          to: 'pictures', as: :upload

    get  'dates',           to: 'pages',    as: :dates
    get  'debug',           to: 'pages',    as: :debug
    get  'init',            to: 'pages',    as: :init
    get  'form_validation', to: 'pages',    as: :form_validation
    post 'form_validation', to: 'pages'
    get  'multi_form',      to: 'pages',    as: :multi_form
    get  'net_http',        to: 'pages',    as: :net_http
    post 'send_msg',        to: 'pages',    as: :send_msg
    get  'sf_sample',       to: 'pages',    as: :sf_page
    get  'sexi_tips',       to: 'pages',    as: :sexi_tips
    post 'show_year',       to: 'pages',    as: :show_year
    post 'update_year',     to: 'pages',    as: :update_year
    get  'yaml_files',      to: 'pages',    as: :yaml_file
    get  'zt_mailer',       to: 'pages',    as: :zt_mailer

    # ZT Comments
    get 'zt_group_cmt', to: 'pages',    as: :zt_group_cmt
    get 'zt_i18n_cmt',  to: 'pages',    as: :zt_i18n_cmt

    root to: "pages#home"
  end

  # Root route is directed to default locale
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  # All other routes without locales are directed to the same ones with locales
  get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false

  ### ZT: End locale handling ###

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
