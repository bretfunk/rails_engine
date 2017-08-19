class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def show
    render json: Item.find(params[:item_id])
  end
end

