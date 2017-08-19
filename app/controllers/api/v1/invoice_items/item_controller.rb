class Api::V1::InvoiceItems::ItemController < ApplicationController

  def show
    #render json: Item.find(params[:item_id])
    render json: InvoiceItem.find(params[:id]).item
  end
end

