class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all, each_serializer: InvoiceItemsSerializer
  end

  def show
    render json: InvoiceItem.find(params[:id]), serializer: InvoiceItemsSerializer
  end

end
