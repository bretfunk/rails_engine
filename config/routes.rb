Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "merchants/find_all", to: "merchants/search#index"
      get "merchants/find", to: "merchants/search#show"
      get "merchants/random", to: "merchants/random#show"
      resources :merchants, only: [:index, :show]
      namespace :merchants, only: [:index, :show] do
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
      end

      get "invoices/find_all", to: "invoices/search#index"
      get "invoices/find", to: "invoices/search#show"
      get "invoices/random", to: "invoices/random#show"
      resources :invoices, only: [:index, :show]
      namespace :invoices, only: [:index, :show] do
        get "/:id/merchant", to: "merchants#show"
        get "/:id/customer", to: "customers#show"
        get "/:id/items", to: "items#show"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/transactions", to: "transactions#index"
      end

      get "customers/find_all", to: "customers/search#index"
      get "customers/find", to: "customers/search#show"
      get "customers/random", to: "customers/random#show"
      resources :customers, only: [:index, :show]
      namespace :customers, only: [:index, :show] do
        get "/:id/invoices", to: "invoices#index"
        get "/:id/transactions", to: "transactions#index"
      end

      get "transactions/find_all", to: "transactions/search#index"
      get "transactions/find", to: "transactions/search#show"
      get "transactions/random", to: "transactions/random#show"
      resources :transactions, only: [:index, :show]
      namespace :transactions, only: [:index, :show] do
        get "/:id/invoices", to: "invoices#index"
      end

      get "items/find_all", to: "items/search#index"
      get "items/find", to: "items/search#show"
      get "items/random", to: "items/random#show"
      resources :items, only: [:index, :show]
      namespace :items, only: [:index, :show] do
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/merchant", to: "merchants#show"
      end

      get "invoice_items/find_all", to: "invoice_items/search#index"
      get "invoice_items/find", to: "invoice_items/search#show"
      get "invoice_items/random", to: "invoice_items/random#show"
      resources :invoice_items, only: [:index, :show]
      namespace :invoice_items, only: [:index, :show] do
        get "/:id/invoice", to: "invoices#show"
        get "/:id/item", to: "items#show"
      end
    end
  end
end
