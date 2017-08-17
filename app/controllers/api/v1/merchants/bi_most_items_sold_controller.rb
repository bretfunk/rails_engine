class Api::V1::Merchants::BiMostItemsSoldController < ApplicationController

  def index
    render json: Merchant.most_items_sold(limit)
  end
end
