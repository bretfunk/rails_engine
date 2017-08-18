class Api::V1::Merchants::BiMostItemsSoldController < ApplicationController

  def index
    quantity = params[:quantity]
    render json: Merchant.most_items_sold(quantity)#, serializer: MostItemsAllMerchantsSerializer
  end

end
