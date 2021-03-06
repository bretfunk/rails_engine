Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "merchants/most_revenue", to: "merchants/bi_most_revenue#index"
      get "merchants/most_items", to: "merchants/bi_most_items_sold#index"
      get "merchants/revenue", to: "merchants/bi_all_revenue#index"
      get "merchants/find_all", to: "merchants/search#index"
      get "merchants/find", to: "merchants/search#show"
      get "merchants/random", to: "merchants/random#show"
      get "merchants/most_revenue", to: "merchants/bi_most_revenue#show"
      get "merchants/:id/revenue", to: "merchants/bi_revenue#show"
      get "merchants/:id/favorite_customer", to: "merchants/favorite_customers#show"
      get "merchants/:id/customers_with_pending_invoices", to: "merchants/bi_pending_invoices#index"
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
        get "/:id/items", to: "items#index"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/transactions", to: "transactions#index"
      end

      get "customers/find_all", to: "customers/search#index"
      get "customers/find", to: "customers/search#show"
      get "customers/random", to: "customers/random#show"
      get "customers/:id/favorite_merchant", to: "customers/bi_favorite_merchant#show"
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
        get "/:id/invoice", to: "invoice#index"
      end

      get "items/find_all", to: "items/search#index"
      get "items/find", to: "items/search#show"
      get "items/random", to: "items/random#show"
      get "/items/most_revenue", to: "items/bi_most_revenue#show"
      get "/items/most_items", to: "items/bi_most_items#show"
      get "items/:id/best_day", to: "items/bi_best_day#show"
      namespace :items, only: [:index, :show] do
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/merchant", to: "merchants#show"
      end
      resources :items, only: [:index, :show]

      get "invoice_items/find_all", to: "invoice_items/search#index"
      get "invoice_items/find", to: "invoice_items/search#show"
      get "invoice_items/random", to: "invoice_items/random#show"
      resources :invoice_items, only: [:index, :show]
      namespace :invoice_items, only: [:index, :show] do
        get "/:id/invoice", to: "invoice#show"
        get "/:id/item", to: "item#show"
      end
    end
  end
end
