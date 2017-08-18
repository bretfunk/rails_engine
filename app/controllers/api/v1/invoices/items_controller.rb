class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    render json: Invoice.find(params[:id]).items,  each_serializer: ItemSerializer
  end
end
