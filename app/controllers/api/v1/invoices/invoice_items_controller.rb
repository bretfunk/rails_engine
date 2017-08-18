class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.where(invoice_id: params[:id]), each_serializer: InvoiceItemsSerializer
  end
end
