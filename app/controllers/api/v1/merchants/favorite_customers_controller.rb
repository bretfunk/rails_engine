class Api::V1::Merchants::FavoriteCustomersController < ApplicationController

  def show
    render json: Merchant.favorite_customer(params[:id])
  end

end
