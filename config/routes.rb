Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      namespace :invoices, only: [:index, :show] do
        #resources :transactions, only: [:index]
        #resources :invoice_items, only: [:index]
        #resources :items, only: [:index]
        #resources :customers, only: [:show]
        get "/:id/merchant", to: "merchants#show"
        get "/:id/customer", to: "customers#show"
        get "/:id/items", to: "items#show"
        get "/:id/invoice_items", to: "invoice_items#show"
        get "/:id/transactions", to: "transactions#show"
      end

      resources :invoice_items, only: [:index, :show]
    end
  end
end
