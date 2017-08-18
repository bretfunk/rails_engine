class Api::V1::Merchants::BiMostItemsSoldController < ApplicationController

  def index
    render json: Merchant.most_items_sold(params[:quantity])
  end

  private

  def limit
    params.permit(:quantity)
  end
end
