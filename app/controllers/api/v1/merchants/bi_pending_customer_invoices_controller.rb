class Api:V1::Merchants::PendingCustomerInvoicesController < ApplicationController

  def index
    #render json: Merchant.find(params[:id]).pending_invoices
    render json: Merchant.find(params[:id]).pending_invoices
  end
end
