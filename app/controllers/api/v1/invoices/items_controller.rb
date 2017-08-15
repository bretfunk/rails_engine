class Api::V1::Invoices::ItemsController < ApplicationController

  def show
    render json: InvoiceItem.where(invoice_id: params[:id])
  end
end
