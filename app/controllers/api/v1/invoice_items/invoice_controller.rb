class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def show
    #render json: InvoiceItem.find(params[:id]).invoice
    render json: Invoice.find(params[:invoice_id])
  end
end
